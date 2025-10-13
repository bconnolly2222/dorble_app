import 'package:dorble/Variables/list_variables.dart';
import 'package:dorble/Variables/list_variables_unlimited.dart';
import 'package:dorble/Variables/stats.dart';
import 'package:dorble/pages/home_page.dart';
import 'package:dorble/pages/daily_dorble.dart';
import 'package:dorble/pages/stats_page.dart';
import 'package:dorble/pages/unlimited_dorble.dart';
import 'package:dorble/pages/settings_page.dart';
import 'package:dorble/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


void main() async {
  WidgetsBinding wb = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: wb);
  await MobileAds.instance.initialize();
  await UnlimitedStats.init();
  await DailyStats.init();
  await Supabase.initialize(
    url: 'https://yqnznlaqdzvlpkmvhubq.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlxbnpubGFxZHp2bHBrbXZodWJxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTk5NzM3NzMsImV4cCI6MjA3NTU0OTc3M30.2Z3eEiOHfSj4iQFnu2ELyPsbGEshzEG5y0TtMthMG6U',
  );
  await initDaily();
  await initUnlimited();
  Future.delayed(const Duration(seconds: 3));
  FlutterNativeSplash.remove();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => DailyStats()),
        ChangeNotifierProvider(create: (context) => UnlimitedStats()),
      ],
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