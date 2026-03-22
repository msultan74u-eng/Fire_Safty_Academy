import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../constants/web_actions.dart';
import '../widgets/home_Widgets/Search_card.dart';
import '../widgets/home_Widgets/carousel_home.dart';
import '../widgets/home_Widgets/custom_app_bar.dart';
import '../widgets/home_Widgets/drawer_home.dart';
import '../widgets/home_Widgets/fire_grid_home.dart';
import '../widgets/home_Widgets/media_sub_bar.dart';

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
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double availableHeight =
        MediaQuery.of(context).size.height -
        kToolbarHeight -
        (MediaQuery.of(context).padding.top + 54);

    double gridWidth = availableHeight / 7.2;

    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 720;
    return Scaffold(
      key: scaffoldKey,
      drawer: DrawerHome(),
      appBar: CustomAppBar(
        isDarkNotifier: widget.isDarkNotifier,
        toggleTheme: widget.toggleTheme,
        webActionsIcons: WebActions.build(
          onNotifications: () {},
          onSearch: () {},
          onSettings: () {},
          onHelp: () {},
        ),
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

                  Expanded(
                    child: FireGridHome(
                      isDarkNotifier: widget.isDarkNotifier,
                      toggleTheme: widget.toggleTheme,
                    ),
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(bottom: 4, left: 12, right: 12),
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
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 42,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: ConstrainedBox(
                                  constraints: const BoxConstraints(
                                    maxWidth: 400,
                                  ),
                                  child: MediaSubBar(),
                                ),
                              ),
                            ),
                            Expanded(child: CarouselHome()),
                          ],
                        );
                      },
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
                        Flexible(
                          flex: 9,
                          child: FireGridHome(
                            isDarkNotifier: widget.isDarkNotifier,
                            toggleTheme: widget.toggleTheme,
                          ),
                        ),

                        const Divider(),

                        Flexible(
                          flex: 1,
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
                                minFontSize: 8,
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
