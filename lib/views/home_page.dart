import 'package:flutter/material.dart';

import '../core/themes/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.isDarkNotifier,
    required this.toggleTheme,
  });

  final ValueNotifier<bool> isDarkNotifier;
  final VoidCallback toggleTheme;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          'Fire Safty Academy',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,

        actions: [
          ValueListenableBuilder<bool>(
            valueListenable: widget.isDarkNotifier,
            builder: (context, isDark, child) {
              return Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Ink(
                  width: 36, // حجم الدائرة صغير
                  height: 36, // حجم الدائرة صغير
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(
                      0.2,
                    ), // شفاف جزئي مناسب على الأحمر
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 3,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: IconButton(
                    iconSize: 20, // حجم الأيقونة أصغر ليتناسب مع الدائرة
                    icon: Icon(
                      isDark ? Icons.light_mode : Icons.dark_mode,
                      color: Colors.white,
                    ),
                    onPressed: widget.toggleTheme,
                    tooltip: 'Toggle Theme',
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(color: Theme.of(context).scaffoldBackgroundColor),
    );
  }
}
