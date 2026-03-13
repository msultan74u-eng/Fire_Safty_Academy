import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({
    super.key,
    required this.isDarkNotifier,
    required this.toggleTheme,
  });

  final ValueNotifier<bool> isDarkNotifier;
  final VoidCallback toggleTheme;

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();
  int currentPage = 0;

  List<Map<String, String>> onboardingData = [
    {
      "title": "Fire Alarm Systems",
      "desc":
          "Learn how fire alarm systems detect smoke, heat, or flames and alert people to evacuate the building quickly and safely.",
    },
    {
      "title": "Fire Fighting Systems",
      "desc":
          "Explore fire fighting equipment such as sprinklers, fire pumps, hydrants, and extinguishers used to control and suppress fires.",
    },
    {
      "title": "Fire Protection Engineering",
      "desc":
          "Understand fire protection design principles, safety standards, and systems used to protect buildings and human life.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller,
              itemCount: onboardingData.length,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 120,
                        height: 120,
                        child: Image.asset(
                          'assets/images/main_design/Logo_Fire.png',
                        ),
                      ),

                      const SizedBox(height: 40),

                      Text(
                        onboardingData[index]["title"]!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 20),

                      Text(
                        onboardingData[index]["desc"]!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 20),

          ElevatedButton(
            // onPressed: () {
            //   if (currentPage == 2) {
            //     // go to home page
            //     Navigator.pushReplacement(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => HomePage(
            //           isDarkNotifier: widget.isDarkNotifier,
            //           toggleTheme: widget.toggleTheme,
            //         ),
            //       ),
            //     );
            //   } else {
            //     controller.nextPage(
            //       duration: const Duration(milliseconds: 500),
            //       curve: Curves.ease,
            //     );
            //   }
            // },

            onPressed: () async {
              if (currentPage == 2) {

                final prefs = await SharedPreferences.getInstance();
                await prefs.setBool('onboarding_seen', true);

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(
                      isDarkNotifier: widget.isDarkNotifier,
                      toggleTheme: widget.toggleTheme,
                    ),
                  ),
                );

              } else {
                controller.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              }
            },

            child: Text(currentPage == 2 ? "Start" : "Next"),
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
