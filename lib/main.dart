import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'pages/installed_apps.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Shabnam',
        useMaterial3: true,
        colorSchemeSeed: Colors.blue, // رنگ تم پایه
      ),
      debugShowCheckedModeBanner: false,
      locale: const Locale('fa', 'IR'),
      supportedLocales: const [Locale('fa', 'IR')],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      home: InstalledAppsPage(),
    );
  }
}
