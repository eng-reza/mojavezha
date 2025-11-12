import 'package:logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:installed_apps/app_info.dart' show AppInfo;
import 'package:installed_apps/installed_apps.dart';
import 'package:lottie/lottie.dart';

class PerModule extends StatefulWidget {
  const PerModule({super.key});

  @override
  State<PerModule> createState() => _PerModuleState();
}

class _PerModuleState extends State<PerModule> {
  Logger logger = Logger();
  List<AppInfo> apps = [];
  bool loading = false;
  static const platform = MethodChannel('com.example.app_permissions/native');
  Map<String, Map<String, bool>> appPermissionStates = {};

  @override
  void initState() {
    super.initState();
    loadApps();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('دسترسی‌ها')),
      body: loading
          ? Center(
              child: Lottie.asset(
                'assets/json/Material wave loading.json',
                width: 200,
                height: 200,
              ),
            )
          : Column(children: [Expanded(child: _buildPermissionList())]),
    );
  }

  Future<void> loadApps() async {
    setState(() => loading = true);
    try {
      final list = await InstalledApps.getInstalledApps(withIcon: true);

      list.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));

      apps = list;
      for (var app in apps) {
        logger.i('Apps recieved : ${app.name}');
        final perms = await _getPermissions(app.packageName);
        appPermissionStates[app.packageName] = perms;
      }
    } catch (e) {
      logger.e('Error loading apps: $e');
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  // دریافت دسترسی اپ ها از متدچنل //
  Future<Map<String, bool>> _getPermissions(String packageName) async {
    try {
      final result = await platform.invokeMethod('getAppPermissions', {
        'packageName': packageName,
      });
      //اینجا پرمیشن های هر اپ  چک میشه //
      logger.i('Permissions for $packageName');
      (result as Map).forEach((key, value) {
        logger.i('   $key => $value');
      });

      return Map<String, bool>.from(result.cast<String, bool>());
    } catch (e) {
      logger.e('Error getting permissions for $packageName: $e');

      return {};
    }
  }

  Widget _buildPermissionList() {
    final Map<String, String> PermissionsName = {
      'android.permission.FOREGROUND_SERVICE_CAMERA': 'دسترسی به دوربین',
      'android.permission.FOREGROUND_SERVICE_MICROPHONE': 'دسترسی به میکروفن',
      'android.permission.FOREGROUND_SERVICE_LOCATION': 'دسترسی به لوکیشن',
      'android.permission.WRITE_EXTERNAL_STORAGE': 'نوشتن در حافظه دستگاه',
      'android.permission.MANAGE_EXTERNAL_STORAGE': 'مدیریت حافظه دستگاه',
      'android.permission.POST_NOTIFICATIONS': 'ارسال و پردازش اعلان ها',
      'android.permission.READ_CONTACTS': 'دسترسی به مخاطبین',
      'android.permission.FOREGROUND_SERVICE_PHONE_CALL':
          'دسترسی به سرویس برقراری تماس',
      'android.permission.ACCESS_WIFI_STATE': 'دسترسی به شبکه وای فای',
      // 'android.permission.ACCESS_NETWORK_STATE': 'دسترسی به اینترنت همراه',
      'android.permission.INTERNET': 'دسترسی به اینترنت',
      'android.permission.RECORD_AUDIO': 'دسترسی به ضبط صدا',
      'android.permission.MANAGE_ACCOUNTS': 'دسترسی به حساب های کاربری',
      'android.permission.NFC': 'دسترسی به ماژول NFC',
    };
    final entries = PermissionsName.entries.toList();
    return ListView.builder(
      shrinkWrap: true,
      itemCount: entries.length,
      itemBuilder: (context, index) {
        final permKey = entries[index].key;
        final permName = entries[index].value;
        return ListTile(
          leading: const Icon(Icons.lock),
          title: Text(
            permName.isNotEmpty ? permName : permKey,
          ), // می‌توانید نام کاربرپسند بگذارید مثل "دوربین"
          trailing: const Icon(Icons.chevron_right),
          onTap: () => _showAppsForPermission(permKey),
        );
      },
    );
  }

  void _showAppsForPermission(String permission) {
    final appsWithPerm = apps.where((app) {
      final perms = appPermissionStates[app.packageName];
      if (perms == null) return false;
      // بررسی کلید کامل اندروید بازگشتی از متدچنل //
      bool hasPermission = perms[permission] == true;

      // اگر کلید کوتاه بود تبدیلش کن به کلید کامل //
      if (!hasPermission) {
        final androidKey = 'android.permission.${permission.toUpperCase()}';
        hasPermission = perms[androidKey] == true;
      }
      return hasPermission;
    }).toList();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('اپ‌ها با دسترسی $permission'),
        content: appsWithPerm.isEmpty
            ? const Text('این دسترسی به هیچ نرم افزاری اعطا نشده است')
            : SizedBox(
                width: double.maxFinite,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: appsWithPerm.length,
                  itemBuilder: (context, index) {
                    final app = appsWithPerm[index];
                    return ListTile(
                      leading: app.icon != null
                          ? Image.memory(app.icon!, width: 40, height: 40)
                          : const Icon(Icons.apps),
                      title: Text(app.name),
                    );
                  },
                ),
              ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('بستن'),
          ),
        ],
      ),
    );
  }
}
