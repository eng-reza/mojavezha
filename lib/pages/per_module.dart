import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    final size = MediaQuery.of(context).size;
    bool isPhone = size.width < 600;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'بررسی مجوزها بر اساس نوع دسترسی',
          style: TextStyle(fontSize: isPhone ? 20 : 30),
        ),
        centerTitle: true,
      ),
      body: loading
          ? Center(
              child: Lottie.asset(
                'assets/json/Material wave loading.json',
                width: 200,
                height: 200,
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: isPhone ? 50 : 100),
                  Expanded(child: _buildPermissionList(isPhone)),
                ],
              ),
            ),
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

  Widget _buildPermissionList(bool isPhone) {
    final Map<String, String> PermissionsName = {
      'android.permission.FOREGROUND_SERVICE_CAMERA': 'دوربین',
      'android.permission.FOREGROUND_SERVICE_MICROPHONE': 'میکروفن',
      'android.permission.FOREGROUND_SERVICE_LOCATION': 'لوکیشن',
      'android.permission.WRITE_EXTERNAL_STORAGE': 'نوشتن در حافظه',
      'android.permission.MANAGE_EXTERNAL_STORAGE': 'مدیریت حافظه',
      'android.permission.POST_NOTIFICATIONS': 'اعلان ها',
      'android.permission.READ_CONTACTS': 'مخاطبین',
      'android.permission.FOREGROUND_SERVICE_PHONE_CALL': 'برقراری تماس',
      'android.permission.ACCESS_WIFI_STATE': 'WIFI',
      // 'android.permission.ACCESS_NETWORK_STATE': 'دسترسی به اینترنت همراه',
      'android.permission.INTERNET': 'اینترنت',
      'android.permission.RECORD_AUDIO': 'ضبط صدا',
      'android.permission.MANAGE_ACCOUNTS': 'حساب کاربری',
      'android.permission.NFC': 'NFC',
      'android.permission.READ_BASIC_PHONE_STATE': 'اطلاعات تلفن',
    };

    final Map<String, IconData> permissionsIcon = {
      'android.permission.FOREGROUND_SERVICE_CAMERA': Icons.camera_alt_sharp,
      'android.permission.FOREGROUND_SERVICE_MICROPHONE': Icons.mic_rounded,
      'android.permission.FOREGROUND_SERVICE_LOCATION': Icons.location_city,
      'android.permission.WRITE_EXTERNAL_STORAGE': Icons.storage_sharp,
      'android.permission.MANAGE_EXTERNAL_STORAGE': Icons.memory_sharp,
      'android.permission.POST_NOTIFICATIONS': Icons.notification_add_sharp,
      'android.permission.READ_CONTACTS': Icons.contacts_sharp,
      'android.permission.FOREGROUND_SERVICE_PHONE_CALL': Icons.call_made_sharp,
      'android.permission.ACCESS_WIFI_STATE': Icons.wifi,
      // 'android.permission.ACCESS_NETWORK_STATE': 'دسترسی به اینترنت همراه',
      'android.permission.INTERNET': FontAwesomeIcons.internetExplorer,
      'android.permission.RECORD_AUDIO': FontAwesomeIcons.audioDescription,
      'android.permission.MANAGE_ACCOUNTS': Icons.account_box_sharp,
      'android.permission.NFC': Icons.nfc_sharp,
      'android.permission.READ_BASIC_PHONE_STATE': Icons.info_sharp,
    };
    final entries = PermissionsName.entries.toList();
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: isPhone ? 5 : 15,
        mainAxisSpacing: isPhone ? 30 : 40,
        childAspectRatio: isPhone ? 3 : 2,
      ),
      itemCount: entries.length,
      itemBuilder: (context, index) {
        final permKey = entries[index].key;
        final permName = entries[index].value;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade700,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              elevation: 3,
            ),
            onPressed: () => _showAppsForPermission(permKey, permName),
            child: Row(
              children: [
                Icon(permissionsIcon[permKey], color: Colors.white, size: 25),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    permName.isNotEmpty ? permName : permKey,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showAppsForPermission(String permission, String permissionName) {
    final appsWithPerm = apps.where((app) {
      final perms = appPermissionStates[app.packageName];
      if (perms == null) return false;

      bool hasPermission = perms[permission] == true;
      if (!hasPermission) {
        final androidKey = 'android.permission.${permission.toUpperCase()}';
        hasPermission = perms[androidKey] == true;
      }
      return hasPermission;
    }).toList();

    final icon = _getPermissionIcon(permission);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        titlePadding: const EdgeInsets.only(top: 16, left: 16, right: 16),
        contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue.shade700,
              child: Icon(icon, color: Colors.white),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                permissionName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
        content: appsWithPerm.isEmpty
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 10),
                  Icon(
                    Icons.lock_outline,
                    size: 48,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'این دسترسی به هیچ نرم‌افزاری اعطا نشده است',
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            : SizedBox(
                width: double.maxFinite,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'تعداد اپ‌ها: ${appsWithPerm.length}',
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 13,
                      ),
                    ),
                    const Divider(),
                    Flexible(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: appsWithPerm.length,
                        itemBuilder: (context, index) {
                          final app = appsWithPerm[index];
                          return ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 4,
                            ),
                            leading: app.icon != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.memory(
                                      app.icon!,
                                      width: 40,
                                      height: 40,
                                    ),
                                  )
                                : const Icon(Icons.apps),
                            title: Text(app.name),
                            subtitle: Text(
                              app.packageName,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
        actions: [
          TextButton.icon(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close, color: Colors.blue),
            label: const Text(
              'بستن',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  /// آیکون مناسب بر اساس کلید مجوز برمی‌گرداند
  IconData _getPermissionIcon(String key) {
    const icons = {
      'android.permission.FOREGROUND_SERVICE_CAMERA': Icons.camera_alt_sharp,
      'android.permission.FOREGROUND_SERVICE_MICROPHONE': Icons.mic_rounded,
      'android.permission.FOREGROUND_SERVICE_LOCATION': Icons.location_on,
      'android.permission.WRITE_EXTERNAL_STORAGE': Icons.storage_sharp,
      'android.permission.MANAGE_EXTERNAL_STORAGE': Icons.memory_sharp,
      'android.permission.POST_NOTIFICATIONS': Icons.notifications,
      'android.permission.READ_CONTACTS': Icons.contacts_sharp,
      'android.permission.FOREGROUND_SERVICE_PHONE_CALL': Icons.call,
      'android.permission.ACCESS_WIFI_STATE': Icons.wifi,
      'android.permission.INTERNET': FontAwesomeIcons.internetExplorer,
      'android.permission.RECORD_AUDIO': FontAwesomeIcons.microphone,
      'android.permission.MANAGE_ACCOUNTS': Icons.account_circle,
      'android.permission.NFC': Icons.nfc,
    };
    return icons[key] ?? Icons.security;
  }
}
