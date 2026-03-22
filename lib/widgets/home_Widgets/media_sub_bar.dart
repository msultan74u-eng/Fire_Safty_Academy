import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class MediaSubBar extends StatefulWidget {
  const MediaSubBar({super.key});

  @override
  State<MediaSubBar> createState() => _MediaSubBarState();
}

class _MediaSubBarState extends State<MediaSubBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmall = screenWidth < 420;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _subAppBar(
          index: 0,
          icon: Icons.video_library,
          label: 'Videos',
          isSmall: isSmall,
          onPressed: () {
            setState(() => selectedIndex = 0);
          },
        ),
        const SizedBox(width: 6),
        _subAppBar(
          index: 1,
          icon: Icons.picture_as_pdf,
          label: 'PDF',
          isSmall: isSmall,
          onPressed: () {
            setState(() => selectedIndex = 1);
          },
        ),
        const SizedBox(width: 6),
        _subAppBar(
          index: 2,
          icon: Icons.image,
          label: 'Images',
          isSmall: isSmall,
          onPressed: () {
            setState(() => selectedIndex = 2);
          },
        ),
      ],
    );
  }

  Widget _subAppBar({
    required int index,
    required IconData icon,
    required String label,
    required bool isSmall,
    required VoidCallback onPressed,
  }) {
    final bool isSelected = selectedIndex == index;
    final themeColor = Theme.of(context).colorScheme.primary;

    return Expanded(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green : themeColor,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: Colors.green.withOpacity(0.3),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
          ],
        ),
        child: ElevatedButton.icon(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            elevation: 0,

            // تصغير padding حسب الشاشة
            padding: EdgeInsets.symmetric(
              horizontal: isSmall ? 2 : 8,
              vertical: isSmall ? 2 : 6,
            ),

            // تقليل ارتفاع الزر
            minimumSize: Size(0, isSmall ? 28 : 38),

            // يمنع Flutter من تكبير مساحة اللمس
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          icon: Icon(icon, size: isSmall ? 14 : 20, color: Colors.white),
          label: AutoSizeText(
            label,
            maxLines: 1,
            minFontSize: 8,
            style: TextStyle(
              fontSize: isSmall ? 10 : 14,
              color: Colors.white,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
