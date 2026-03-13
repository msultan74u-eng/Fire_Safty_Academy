import 'package:fire_safty_academy/views/splach_screen/main_splash.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // نستخدم ValueNotifier
  ValueNotifier<bool> isDark = ValueNotifier(true);

  @override
  void initState() {
    super.initState();
    loadTheme();
  }
  void loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    bool savedTheme = prefs.getBool('isDarkTheme') ?? true;
    isDark.value = savedTheme;
  }
  // void toggleTheme() {
  //   isDark.value = !isDark.value;
  // }
  void toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();

    isDark.value = !isDark.value;

    await prefs.setBool('isDarkTheme', isDark.value);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isDark,
      builder: (context, value, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: value ? ThemeMode.dark : ThemeMode.light,
          title: 'Fire Safety Academy',
          home: MainSplash(toggleTheme: toggleTheme, isDarkNotifier: isDark),
        );
      },
    );
  }
}
