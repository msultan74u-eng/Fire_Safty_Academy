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
  final List<Widget> webActions = [
    IconButton(
      icon: const Icon(Icons.notifications, color: Colors.white),
      onPressed: () {},
      tooltip: "Notifications",
    ),
    IconButton(
      icon: const Icon(Icons.search, color: Colors.white),
      onPressed: () {},
      tooltip: 'Search',
    ),
    IconButton(
      icon: const Icon(Icons.settings, color: Colors.white),
      onPressed: () {},
      tooltip: 'Settings',
    ),
    IconButton(
      icon: const Icon(Icons.help_outline, color: Colors.white),
      onPressed: () {},
      tooltip: 'Help',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isDarkNotifier: widget.isDarkNotifier,
        toggleTheme: widget.toggleTheme,
        webActionsIcons: webActions,
      ),
      body: Container(color: Theme.of(context).scaffoldBackgroundColor),
    );
  }
}
