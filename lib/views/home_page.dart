import 'package:flutter/material.dart';

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
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFF5252), Color(0xFFD32F2F), Color(0xFFB71C1C)],
              // stops: [0.06, 0.2, 1.0],
              end: Alignment.topLeft,
              begin: Alignment.bottomRight,
            ),
          ),
        ),

        leading: Builder(
          builder: (context) {
            double w = MediaQuery.of(context).size.width;
            if (w < 720) {
              // أيقونة القائمة على الموبايل
              return IconButton(
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: () {},
              );
            } else {
              // شعار التطبيق على التابلت/ويب
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/images/main_design/main_logo.png',
                  width: 30,
                  height: 30,
                  fit: BoxFit.contain,
                ),
              );
            }
          },
        ),

        title: LayoutBuilder(
          builder: (context, constraints) {
            double width = MediaQuery.of(context).size.width;
            if (width < 720) {
              // موبايل: title في الوسط مع الشعار
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/main_design/main_logo.png',
                    width: 30,
                    height: 30,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 6),
                  Flexible(
                    child: const Text(
                      'Fire Safety Academy',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              );
            } else {
              // تابلت/ويب: title على البداية فقط
              return const Text(
                'Fire Safety Academy',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                overflow: TextOverflow.ellipsis,
              );
            }
          },
        ),
        centerTitle: MediaQuery.of(context).size.width < 720 ? true : false,

        titleSpacing: 0,

        actions: [
          // أيقونات إضافية للويب فقط
          Builder(
            builder: (context) {
              bool isWeb = MediaQuery.of(context).size.width >= 720;
              if (!isWeb) return const SizedBox.shrink();

              return Row(
                mainAxisSize:
                    MainAxisSize.min, // مهم جداً لكي لا يملأ الـ AppBar
                children: [
                  IconButton(
                    icon: const Icon(Icons.notifications, color: Colors.white),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.search, color: Colors.white),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.settings, color: Colors.white),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.help_outline, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              );
            },
          ),

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
