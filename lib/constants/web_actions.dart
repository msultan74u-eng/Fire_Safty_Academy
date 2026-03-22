import 'package:flutter/material.dart';

class WebActions {
  static List<Widget> build({
    required VoidCallback onNotifications,
    required VoidCallback onSearch,
    required VoidCallback onSettings,
    required VoidCallback onHelp,
  }) {
    return [
      IconButton(
        icon: const Icon(Icons.notifications, color: Colors.white),
        onPressed: onNotifications,
        tooltip: "Notifications",
      ),
      IconButton(
        icon: const Icon(Icons.search, color: Colors.white),
        onPressed: onSearch,
        tooltip: 'Search',
      ),
      IconButton(
        icon: const Icon(Icons.settings, color: Colors.white),
        onPressed: onSettings,
        tooltip: 'Settings',
      ),
      IconButton(
        icon: const Icon(Icons.help_outline, color: Colors.white),
        onPressed: onHelp,
        tooltip: 'Help',
      ),
    ];
  }
}
