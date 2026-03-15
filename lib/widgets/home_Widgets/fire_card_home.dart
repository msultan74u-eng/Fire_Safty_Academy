import 'package:flutter/material.dart';

class FireCardHome extends StatefulWidget {
  final String title;
  final String backgroundImage;
  final String iconImage;
  final VoidCallback onTap;

  const FireCardHome({
    super.key,
    required this.title,
    required this.backgroundImage,
    required this.iconImage,
    required this.onTap,
  });

  @override
  State<FireCardHome> createState() => _FireCardHomeState();
}

class _FireCardHomeState extends State<FireCardHome>
    with SingleTickerProviderStateMixin {
  double _scale = 1.0;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _scale = 0.95; // يقلل حجم الكارت عند الضغط
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _scale = 1.0;
    });
    widget.onTap();
  }

  void _onTapCancel() {
    setState(() {
      _scale = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOut,
        child: Stack(
          children: [
            // الخلفية
            Card(
              elevation: 4,
              margin: EdgeInsets.zero,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: SizedBox(
                width: double.infinity,
                height: 180,
                child: Image.asset(widget.backgroundImage, fit: BoxFit.cover),
              ),
            ),

            // عنوان الكارت
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 35,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface.withOpacity(0.9),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  widget.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
            ),

            // أيقونة الكارت
            Positioned(
              top: 20, // تحدد بعده من الأعلى
              left: 0, // يمين / يسار
              right: 0,
              child: Align(
                alignment: Alignment.topCenter, // مكان الايقونة بالوسط أفقيًا
                child: Container(
                  height: 92, // ارتفاع الايقونة
                  width: 128, // عرض الايقونة
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(widget.iconImage, fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
