import 'package:fire_safty_academy/services/api_fire_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/themes/app_theme.dart';
import 'cubits/section_cubit/section_cubit.dart';
import 'views/splach_screen/main_splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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

  void toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    isDark.value = !isDark.value;
    await prefs.setBool('isDarkTheme', isDark.value);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isDark,
      builder: (BuildContext context, bool value, Widget? child) {
        return BlocProvider<SectionCubit>(
          create: (BuildContext context) {
            SectionCubit cubit = SectionCubit(ApiService());
            cubit.fetchSections();
            return cubit;
          },
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: value ? ThemeMode.dark : ThemeMode.light,
            title: 'Fire Safety Academy',
            home: MainSplash(toggleTheme: toggleTheme, isDarkNotifier: isDark),
          ),
        );
      },
    );
  }
}
