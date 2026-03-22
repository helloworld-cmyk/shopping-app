import 'package:flutter/material.dart';

class OnboardBackground extends StatelessWidget {
  const OnboardBackground({super.key, required this.assetPath});

  final String assetPath;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(assetPath, fit: BoxFit.cover, alignment: Alignment.center),
        Positioned.fill(
          child: IgnorePointer(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.22),
                    Colors.transparent,
                    Colors.black.withOpacity(0.18),
                  ],
                  stops: const [0.0, 0.58, 1.0],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
