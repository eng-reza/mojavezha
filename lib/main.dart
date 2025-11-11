import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mojavezha/pages/home_page.dart';
import 'pages/installed_apps.dart';
import 'pages/per_module.dart';

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

      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomePage(),
        '/installedApps': (context) => InstalledAppsPage(),
        '/perModule': (context) => PerModule(),
      },
    );
  }
}
