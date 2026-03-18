import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ValueNotifier<bool> isDarkNotifier;
  final VoidCallback toggleTheme;
  final List<Widget>? webActionsIcons;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const CustomAppBar({
    super.key,
    required this.isDarkNotifier,
    required this.toggleTheme,

    this.webActionsIcons,
    required this.scaffoldKey,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 720;

    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFF5252), Color(0xFFD32F2F), Color(0xFFB71C1C)],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
        ),
      ),
      leading: isMobile
          ? IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                scaffoldKey.currentState!.openDrawer();
              },
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/images/main_design/main_logo.png',
                width: 30,
                height: 30,
                fit: BoxFit.contain,
              ),
            ),
      title: isMobile
          ? Row(
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
            )
          : const Text(
              'Fire Safety Academy',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              overflow: TextOverflow.ellipsis,
            ),
      centerTitle: isMobile,
      titleSpacing: 0,
      actions: [
        // if (!isMobile && webActions != null) ...webActionsIcons!,
        if (!isMobile && webActionsIcons != null)
          for (var action in webActionsIcons!) action,
        SizedBox(width: 16),

        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Ink(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.15),
                  blurRadius: 3,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ValueListenableBuilder<bool>(
              valueListenable: isDarkNotifier,
              builder: (context, isDark, child) {
                return IconButton(
                  iconSize: 20,
                  icon: Icon(
                    isDark ? Icons.light_mode : Icons.dark_mode,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  onPressed: toggleTheme,
                  tooltip: 'Toggle Theme',
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
