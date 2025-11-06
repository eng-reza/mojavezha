// lib/widgets/permissions_list.dart
import 'package:flutter/material.dart';
import '../util/permissions_fa.dart';

class PermissionsList extends StatelessWidget {
  final List<String> permissions;

  const PermissionsList({super.key, required this.permissions});

  @override
  Widget build(BuildContext context) {
    if (permissions.isEmpty) {
      return const Center(
        child: Text(
          'هیچ دسترسی خاصی ندارد',
          textDirection: TextDirection.rtl,
          style: TextStyle(fontSize: 16),
        ),
      );
    }

    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListView.builder(
        itemCount: permissions.length,
        itemBuilder: (context, index) {
          final info = translatePermission(permissions[index]);

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            elevation: 2,
            child: ListTile(
              leading: Icon(info.icon, color: Colors.blueAccent),
              title: Text(info.nameFa, style: const TextStyle(fontSize: 16)),
              subtitle: Text(
                permissions[index],
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
          );
        },
      ),
    );
  }
}
