import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'onboard_action_button.dart';
import 'onboard_background.dart';
import 'onboard_dots.dart';
import 'onboard_page_data.dart';

class OnboardSlide extends StatelessWidget {
  const OnboardSlide({
    super.key,
    required this.data,
    required this.index,
    required this.page,
    required this.onNext,
  });

  final OnboardPageData data;
  final int index;
  final double page;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final distance = (page - index).abs().clamp(0.0, 1.0).toDouble();
    final direction = page - index;
    final titleOpacity = 1 - distance * 0.48;
    final titleOffsetX = direction * 28;
    final titleOffsetY = distance * 10;

    return Stack(
      fit: StackFit.expand,
      children: [
        OnboardBackground(assetPath: data.assetPath),
        SafeArea(
          child: Stack(
            children: [
              Positioned(
                left: 20,
                right: 34,
                bottom: 164,
                child: Opacity(
                  opacity: titleOpacity.clamp(0.0, 1.0),
                  child: Transform.translate(
                    offset: Offset(titleOffsetX, titleOffsetY),
                    child: Text(
                      data.title,
                      style: GoogleFonts.bebasNeue(
                        color: Colors.white,
                        fontSize: 54,
                        fontWeight: FontWeight.w400,
                        height: 52 / 54,
                        letterSpacing: 0,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.12),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 20,
                bottom: 102,
                child: Opacity(
                  opacity: titleOpacity.clamp(0.0, 1.0),
                  child: Transform.translate(
                    offset: Offset(titleOffsetX * 0.6, 0),
                    child: OnboardActionButton(onTap: onNext),
                  ),
                ),
              ),
              Positioned(
                right: 22,
                bottom: 28,
                child: OnboardDots(
                  page: page,
                  count: onboardPages.length,
                  activeColor: data.dotColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
