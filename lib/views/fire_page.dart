import 'package:flutter/material.dart';
import '../constants/web_actions.dart';
import '../widgets/home_Widgets/carousel_home.dart';
import '../widgets/home_Widgets/custom_app_bar.dart';
import '../widgets/home_Widgets/drawer_home.dart';
import '../widgets/home_Widgets/media_sub_bar.dart';

class FirePage extends StatefulWidget {
  const FirePage({
    super.key,
    required this.isDarkNotifier,
    required this.toggleTheme,
  });
  final ValueNotifier<bool> isDarkNotifier;
  final VoidCallback toggleTheme;

  @override
  State<FirePage> createState() => _FirePageState();
}

class _FirePageState extends State<FirePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
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
      body: Padding(
        padding: const EdgeInsets.only(left: 6, right: 6, top: 4, bottom: 2),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.36,
              width: double.infinity,
              child: CarouselHome(),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12, top: 2),
                  child: SizedBox(
                    height: 22,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 200),
                        child: MediaSubBar(),
                      ),
                    ),
                  ),
                ),

                Container(
                  // margin: EdgeInsets.only(right: 4),
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    'Fire Alarm',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Divider(
              height: 4,
              // endIndent: screenWidth * 0.31,
              // indent: screenWidth * 0.24,
              endIndent: 12,
              indent: 12,
              radius: BorderRadius.circular(12),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  VerticalDivider(
                    width: 4,
                    indent: 8,
                    endIndent: 8,
                    radius: BorderRadius.circular(12),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
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
