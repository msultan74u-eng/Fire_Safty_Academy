import 'package:flutter/material.dart';

import '../../views/fire_page.dart';
import 'fire_card_home.dart';

class FireGridHome extends StatefulWidget {
  final ValueNotifier<bool> isDarkNotifier;
  final VoidCallback toggleTheme;

  const FireGridHome({
    super.key,
    required this.isDarkNotifier,
    required this.toggleTheme,
  });

  @override
  State<FireGridHome> createState() => _FireGridHomeState();
}

class _FireGridHomeState extends State<FireGridHome> {
  final items = [
    {
      "title": "Fire Alarm",
      "bg": "assets/images/main_design/fire_bg_001.jpg",
      "icon": "assets/images/main_design/facp_0002.jpg",
    },
    {
      "title": "Fire Fighting",
      "bg": "assets/images/main_design/fire_bg_001.jpg",
      "icon": "assets/images/main_design/facp_0002.jpg",
    },
    {
      "title": "Detectors",
      "bg": "assets/images/main_design/fire_bg_001.jpg",
      "icon": "assets/images/main_design/facp_0002.jpg",
    },
    {
      "title": "Extinguishers",
      "bg": "assets/images/main_design/fire_bg_001.jpg",
      "icon": "assets/images/main_design/facp_0002.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 720;

        return GridView.builder(
          scrollDirection: isMobile ? Axis.vertical : Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 320,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return FireCardHome(
              title: item["title"]!,
              backgroundImage: item["bg"]!,
              iconImage: item["icon"]!,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FirePage(
                      isDarkNotifier: widget.isDarkNotifier,
                      toggleTheme: widget.toggleTheme,
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
