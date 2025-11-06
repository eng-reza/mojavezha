import 'package:flutter/material.dart';
import 'package:installed_apps/app_info.dart' show AppInfo;
import 'package:mojavezha/util/permissions_fa.dart';

class AppCard extends StatelessWidget {
  final AppInfo app;
  final Map<String, bool>? perms;
  final Function(AppInfo) onTap;

  const AppCard({
    super.key,
    required this.app,
    this.perms,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: ListTile(
        onTap: () => onTap(app),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: app.icon != null
              ? Image.memory(
                  app.icon!,
                  width: 48,
                  height: 48,
                  fit: BoxFit.cover,
                )
              : const Icon(Icons.apps, size: 48),
        ),
        title: Text(
          app.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(_subtitleForApp(app, perms)),
        trailing: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            // logger.w('لیست مجوزها به انگلیسی : $perms');
            onTap(app);
          },
        ),
      ),
    );
  }

  String _subtitleForApp(AppInfo app, Map<String, bool>? perms) {
    if (perms == null) return 'برای مشاهده مجوزها بزنید';
    final active = perms.entries
        .where((e) => e.value)
        .map((e) => translatePermission(e.key).nameFa)
        .toList();
    if (active.isEmpty) return 'مجوز مهمی فعال نیست';
    final take = active.take(2).join('، ');
    final more = active.length > 2 ? ' و ${active.length - 2} مورد دیگر' : '';
    return '$take$more';
  }
}
