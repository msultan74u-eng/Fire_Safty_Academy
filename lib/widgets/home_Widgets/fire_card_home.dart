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
        child: Card(
          elevation: 4,
          margin: EdgeInsets.zero,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              // ارتفاع الـ Card
              final cardHeight = constraints.maxHeight;

              // اجعل ارتفاع العنوان 20% من ارتفاع الكارت
              final titleHeight = cardHeight * 0.2;

              return Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.backgroundImage),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final availableHeight = constraints.maxHeight;

                          final verticalPadding = availableHeight * 0.05;

                          final iconHeight =
                              availableHeight - (verticalPadding * 2);

                          return Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: verticalPadding,
                              horizontal: verticalPadding,
                            ),
                            child: Container(
                              width: double.infinity,
                              height: iconHeight,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
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
                                child: Image.asset(
                                  widget.iconImage,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    // Container للعنوان responsive
                    Container(
                      height: titleHeight,
                      decoration: BoxDecoration(
                        color: Theme.of(
                          context,
                        ).colorScheme.surface.withOpacity(0.9),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          widget.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
