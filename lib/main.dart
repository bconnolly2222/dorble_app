import 'package:dorble/pages/home_page.dart';
import 'package:dorble/pages/daily_dorble.dart';
import 'package:dorble/pages/stats_page.dart';
import 'package:dorble/pages/unlimited_dorble.dart';
import 'package:dorble/pages/settings_page.dart';
import 'package:dorble/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
      routes: {
        '/home': (context) => const HomePage(),
        '/daily': (context) => const DailyDorble(),
        '/unlimited': (context) => const UnlimitedDorble(),
        '/statistics': (context) => const StatsPage(),
        '/settings': (context) => const SettingsPage(),
      },
    );
  }
}