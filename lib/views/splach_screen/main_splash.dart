import 'dart:async';
import 'package:flutter/material.dart';
import 'onboarding_screen.dart';

class MainSplash extends StatefulWidget {
  const MainSplash({
    super.key,
    required this.isDarkNotifier,
    required this.toggleTheme,
  });

  final ValueNotifier<bool> isDarkNotifier;
  final VoidCallback toggleTheme;

  @override
  State<MainSplash> createState() => _MainSplashState();
}

class _MainSplashState extends State<MainSplash>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    animation = Tween<double>(begin: 0, end: 1).animate(controller);

    controller.forward();

    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => OnboardingScreen(
            isDarkNotifier: widget.isDarkNotifier,
            toggleTheme: widget.toggleTheme,
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        children: [
          const Spacer(),

          FadeTransition(
            opacity: animation,
            child: SizedBox(
              width: 180,
              height: 180,
              child: Image.asset('assets/images/main_design/Logo_Fire.png'),
            ),
          ),

          const Spacer(),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                return LinearProgressIndicator(
                  value: controller.value,
                  minHeight: 6,
                  backgroundColor: Colors.grey[300],
                  valueColor: const AlwaysStoppedAnimation(Colors.red),
                );
              },
            ),
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
