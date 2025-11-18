import 'package:flutter/material.dart';
import 'package:installed_apps/app_info.dart';
import '../util/permissions_fa.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

final Logger logger = Logger();
const platform = MethodChannel('com.example.app_permissions/native');

void showPermissionsDialog(
  BuildContext context,
  AppInfo app,
  Map<String, bool>? perms,
) {
  final pkg = app.packageName;

  showModalBottomSheet(
    isDismissible: true,
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => SafeArea(
      top: false,
      child: DraggableScrollableSheet(
        initialChildSize: 0.6,
        maxChildSize: 0.95,
        minChildSize: 0.3,
        builder: (context, sc) => Container(
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            children: [
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: app.icon != null
                        ? Image.memory(app.icon!, width: 48, height: 48)
                        : const Icon(Icons.apps, size: 48),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          app.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'در اینجا می‌توانید ببینید کدام مجوزها فعال هستند. برای تغییر، از دکمه زیر استفاده کنید.',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[600],
                            height: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Expanded(
                child: perms == null
                    ? const Center(child: CircularProgressIndicator())
                    : perms.keys.isEmpty
                    ? const Center(child: Text('این برنامه مجوز خاصی ندارد.'))
                    : ListView.builder(
                        controller: sc,
                        itemCount: perms.keys.length,

                        itemBuilder: (context, i) {
                          final perm = perms.keys.elementAt(i);
                          final granted = perms[perm] ?? false;
                          final info = translatePermission(perm);
                          return ListTile(
                            leading: Icon(
                              info.icon,
                              size: 30,
                              color: granted ? Colors.green : Colors.grey,
                            ),
                            title: InkWell(
                              onTap: () {
                                logger.i('همه مجوزها ${perms.keys.length}');
                                // writeDeviceLog(perms.toString());
                                _showPermDetailDialog(context, info, perm);
                              },

                              child: Text(
                                info.nameFa,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            trailing: SizedBox(
                              width: 100,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.check_circle,
                                    color: granted ? Colors.green : Colors.grey,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    granted ? '    فعال' : 'غیرفعال',
                                    style: TextStyle(
                                      color: granted
                                          ? Colors.green
                                          : Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () => _openAppSettings(context, pkg),
                      icon: const Icon(Icons.settings),
                      label: const Text('صفحه تنظیمات مجوزها'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton.icon(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close),
                    label: const Text('بستن'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

void _showPermDetailDialog(
  BuildContext context,
  PermissionInfo info,
  String perm,
) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: Row(
        children: [
          Icon(info.icon, color: Colors.blueAccent),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              info.nameFa,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'نوع مجوز:',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 4),
          SelectableText(
            perm,
            style: const TextStyle(color: Colors.black87, fontSize: 14),
          ),
          const SizedBox(height: 12),
          Text(
            'توضیحات:',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 4),
          Text(info.descFa, style: const TextStyle(fontSize: 14, height: 1.4)),
        ],
      ),
    ),
  );
}

void _openAppSettings(BuildContext context, String packageName) async {
  try {
    await platform.invokeMethod('openAppSettings', {
      'packageName': packageName,
    });
  } catch (e) {
    logger.e('openAppSettings failed: $e');
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('امکان باز کردن تنظیمات وجود ندارد')),
      );
    }
  }
}
