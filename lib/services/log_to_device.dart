import 'dart:io';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

final logger = Logger();

Future<void> writeDeviceLog(String message) async {
  final dir = await getApplicationCacheDirectory(); // مسیر امن برای اپ

  if (!await dir.exists()) {
    await dir.create(recursive: true);
    logger.i('Directory created successfuly at: $dir');
  }

  var file = File('${dir.path}/app_log.txt');

  // اگر فایل وجود ندارد، ایجادش کن
  if (!await file.exists()) {
    final timeStamp = DateTime.now().toIso8601String().replaceAll(':', '_');
    file = File('${dir.path}/app_log_$timeStamp.txt');
  }
  final time = DateTime.now().toIso8601String();
  final logMessage = '[$time] $message\n';

  await file.writeAsString(logMessage, mode: FileMode.append);
  logger.i('📄 Log saved to ${file.path}');
}
