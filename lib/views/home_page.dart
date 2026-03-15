import 'package:flutter/material.dart';
import '../widgets/home_Widgets/Search_card.dart';
import '../widgets/home_Widgets/carousel_home.dart';
import '../widgets/home_Widgets/custom_app_bar.dart';
import '../widgets/home_Widgets/fire_grid_home.dart';

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

      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,

              child: CarouselHome(),
            ),
            Divider(
              endIndent: MediaQuery.of(context).size.width * 0.2,
              indent: MediaQuery.of(context).size.width * 0.2,
            ),
            SearchCard(),
            const SizedBox(height: 6),

            Expanded(child: FireGridHome()),
          ],
        ),
      ),
    );
  }
}
