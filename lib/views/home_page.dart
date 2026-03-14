import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';

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
      appBar: CustomAppBar(
        isDarkNotifier: widget.isDarkNotifier,
        toggleTheme: widget.toggleTheme,
        webActionsIcons: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.help_outline, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(color: Theme.of(context).scaffoldBackgroundColor),
    );
  }
}
