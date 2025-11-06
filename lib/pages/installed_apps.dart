import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:logger/logger.dart';
import 'package:mojavezha/widgets/permission_dialog.dart';
import '../widgets/app_card.dart';
import 'package:lottie/lottie.dart';
// import 'package:permission_handler/permission_handler.dart';

class InstalledAppsPage extends StatefulWidget {
  const InstalledAppsPage({super.key});

  @override
  _InstalledAppsPageState createState() => _InstalledAppsPageState();
}

class _InstalledAppsPageState extends State<InstalledAppsPage>
    with AutomaticKeepAliveClientMixin {
  static const platform = MethodChannel('com.example.app_permissions/native');
  @override
  bool get wantKeepAlive => true;

  final Logger logger = Logger();
  List<AppInfo> apps = [];
  Map<String, Map<String, bool>> appPermissionStates = {};
  List<AppInfo> filteredApps = [];
  bool loading = true;
  String searchQuery = '';
  bool showAdvanced = false;

  @override
  void initState() {
    super.initState();
    loadApps();
    // await Permission.manageExternalStorage.request();
  }

  Future<void> loadApps() async {
    setState(() => loading = true);
    try {
      final list = await InstalledApps.getInstalledApps(withIcon: true);
      list.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
      apps = filteredApps = list;

      // دریافت مجوزها بدون setState مکرر
      for (var app in list) {
        try {
          final result = await _getPermissions(app.packageName);
          appPermissionStates[app.packageName] = result;
        } catch (e) {
          logger.e('Failed to get permissions for ${app.packageName}: $e');
        }
      }
    } catch (e) {
      logger.e('Failed to load apps: $e');
    } finally {
      setState(() => loading = false);
    }
  }

  Future<Map<String, bool>> _getPermissions(String packageName) async {
    try {
      final result = await platform.invokeMethod('getAppPermissions', {
        'packageName': packageName,
      });

      return Map<String, bool>.from(result.cast<String, bool>());
    } catch (_) {
      return {};
    }
  }

  void _onSearchChanged(String q) {
    setState(() {
      searchQuery = q;
      filteredApps = apps
          .where(
            (a) =>
                a.name.toLowerCase().contains(q.toLowerCase()) ||
                (showAdvanced &&
                    a.packageName.toLowerCase().contains(q.toLowerCase())),
          )
          .toList();
    });
  }

  bool _isSystemApp(String pkg) {
    final RegExp systemAppRegex = RegExp(
      r'(com\.android|android\.|com\.google\.android|\.android)',
    );
    return systemAppRegex.hasMatch(pkg.toLowerCase());
  }

  Widget _buildAppList(List<AppInfo> list) {
    if (loading) {
      return Center(
        child: Lottie.asset(
          'assets/json/Loading animation blue.json',
          width: 200,
          height: 200,
        ),
      );
    }
    if (list.isEmpty) {
      return const Center(child: Text('هیچ اپلیکیشنی یافت نشد.'));
    }

    return RefreshIndicator(
      onRefresh: loadApps,
      child: ListView.builder(
        key: PageStorageKey(list.hashCode),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        itemCount: list.length,
        itemBuilder: (context, index) {
          final app = list[index];
          return AppCard(
            app: app,
            perms: appPermissionStates[app.packageName],
            onTap: (a) => showPermissionsDialog(
              context,
              a,
              appPermissionStates[a.packageName],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final systemApps = filteredApps
        .where((a) => _isSystemApp(a.packageName))
        .toList();
    final userApps = filteredApps
        .where((a) => !_isSystemApp(a.packageName))
        .toList();

    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('مدیریت مجوزها'),
            centerTitle: true,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(150),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    child: TextField(
                      onChanged: _onSearchChanged,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'جست‌وجوی برنامه...',
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.refresh),
                          onPressed: () {
                            _onSearchChanged('');
                            loadApps();
                          },
                        ),
                        filled: true,
                        fillColor: Theme.of(context).cardColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const TabBar(
                    indicatorColor: Colors.red,
                    tabs: [
                      Tab(icon: Icon(Icons.person), text: 'کاربری'),
                      Tab(icon: Icon(Icons.settings), text: 'سیستمی'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            dragStartBehavior: DragStartBehavior.start,
            children: [_buildAppList(userApps), _buildAppList(systemApps)],
          ),
        ),
      ),
    );
  }
}
