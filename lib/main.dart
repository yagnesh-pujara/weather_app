import 'package:flutter/material.dart';
import 'package:weather_app/screens/home/home_screen.dart';
import 'package:weather_app/utils/theme_settings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeSettings themeSettings = ThemeSettings();
    return MaterialApp(
      title: 'Weather App',
      home: const HomeScreen(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ThemeSettings.seedColor),
        useMaterial3: true,
        textTheme: themeSettings.lightTextTheme,
        elevatedButtonTheme: themeSettings.elevatedButtonTheme,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: ThemeSettings.seedColor,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        textTheme: themeSettings.darkTextTheme,
        elevatedButtonTheme: themeSettings.elevatedButtonTheme,
      ),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
    );
  }
}
