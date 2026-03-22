import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class OnboardDots extends StatelessWidget {
  const OnboardDots({
    super.key,
    required this.page,
    required this.count,
    required this.activeColor,
  });

  final double page;
  final int count;
  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(count, (index) {
        final distance = (page - index).abs().clamp(0.0, 1.0).toDouble();
        final selection = 1 - distance;
        final dotSize = ui.lerpDouble(5.2, 7.2, selection)!;
        final dotColor = Color.lerp(
          Colors.white.withOpacity(0.72),
          activeColor,
          selection,
        )!;

        return Container(
          margin: EdgeInsets.only(left: index == 0 ? 0 : 7),
          width: dotSize,
          height: dotSize,
          decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle),
        );
      }),
    );
  }
}
