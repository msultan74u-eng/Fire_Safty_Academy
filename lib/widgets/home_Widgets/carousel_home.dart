import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselHome extends StatefulWidget {
  const CarouselHome({super.key});

  @override
  State<CarouselHome> createState() => _CarouselHomeState();
}

class _CarouselHomeState extends State<CarouselHome> {
  final List<Map<String, String>> itemsCarousel = [
    {
      "image": "assets/images/main_design/main_logo.png",
      "text": "Fire Safety Academy",
    },
    {
      "image": "assets/images/main_design/main_logo.png",
      "text":
          "'Fire Safety Systems detect, alert, and control fires\nautomatically to protect lives and property.'",
    },
    {
      "image": "assets/images/main_design/main_logo.png",
      "text":
          "Fire Alarm Systems detect smoke, heat, or flames and send alerts to warn occupants and start emergency response.",
    },
    {
      "image": "assets/images/main_design/main_logo.png",
      "text":
          "A typical Fire Alarm System includes detectors, manual call points, control panels, and alarm notification devices.",
    },
    {
      "image": "assets/images/main_design/main_logo.png",
      "text":
          "Fire Fighting Systems such as sprinklers and fire pumps automatically control or extinguish fires.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height:
                MediaQuery.of(context).size.height * 0.22, // ارفع شوية للعنوان
            child: CarouselSlider(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.22,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 1,
              ),
              items: itemsCarousel.map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return Column(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            child: Image.asset(
                              item["image"]!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: AutoSizeText(
                            item["text"]!,
                            style: TextStyle(
                              // fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            minFontSize: 8,
                            maxFontSize: 14,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
