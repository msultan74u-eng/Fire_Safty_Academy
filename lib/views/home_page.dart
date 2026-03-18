import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../widgets/home_Widgets/Search_card.dart';
import '../widgets/home_Widgets/carousel_home.dart';
import '../widgets/home_Widgets/custom_app_bar.dart';
import '../widgets/home_Widgets/drawer_home.dart';
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
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    double availableHeight =
        MediaQuery.of(context).size.height -
        kToolbarHeight - // ارتفاع الـ AppBar
        (MediaQuery.of(context).padding.top + 54); // الـ status bar

    double gridWidth = availableHeight / 5.3;

    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 720;
    return Scaffold(
      key: scaffoldKey,
      drawer: DrawerHome(),
      appBar: CustomAppBar(
        isDarkNotifier: widget.isDarkNotifier,
        toggleTheme: widget.toggleTheme,
        webActionsIcons: webActions,
        scaffoldKey: scaffoldKey,
      ),

      body: isMobile
          ? Padding(
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
            )
          : Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SearchCard(),
                        const SizedBox(height: 10),
                        Expanded(child: CarouselHome()),
                      ],
                    ),
                  ),
                  VerticalDivider(),
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Expanded(child: CarouselHome())],
                    ),
                  ),
                  VerticalDivider(),

                  SizedBox(
                    width: gridWidth,
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.transparent,
                          child: Image.asset(
                            'assets/images/main_design/main_logo.png',

                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(height: 10),
                        // خلي الـ Grid مرن بحيث يقلص تلقائي
                        Flexible(
                          flex: 9, // تعطيه وزن أكبر من النص
                          child: FireGridHome(),
                        ),

                        const Divider(),

                        // خلي النص مرن وauto size
                        Flexible(
                          flex: 1, // أقل وزن للنص
                          child: Container(
                            decoration: BoxDecoration(
                              border: BoxBorder.all(color: Colors.black12),
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            child: Center(
                              child: AutoSizeText(
                                'Sultan SecureTech',
                                style: const TextStyle(
                                  fontFamily: 'Lobster',
                                  color: Colors.blue,
                                ),
                                maxLines: 1,
                                minFontSize: 8, // أصغر حجم ممكن
                                maxFontSize: 16,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
