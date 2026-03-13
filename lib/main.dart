import 'package:fire_safty_academy/views/splach_screen/main_splash.dart';
import 'package:flutter/material.dart';

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

  void toggleTheme() {
    isDark.value = !isDark.value;
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
