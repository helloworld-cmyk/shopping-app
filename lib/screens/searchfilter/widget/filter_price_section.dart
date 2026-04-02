import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/color.dart';

class FilterPriceSection extends StatelessWidget {
  const FilterPriceSection({
    super.key,
    required this.values,
    required this.min,
    required this.max,
    required this.onChanged,
  });

  final RangeValues values;
  final double min;
  final double max;
  final ValueChanged<RangeValues> onChanged;

  String _formatPrice(double price) => '\$${price.round()}';

  @override
  Widget build(BuildContext context) {
    final sliderTheme = SliderTheme.of(context).copyWith(
      trackHeight: 2,
      activeTrackColor: AppColors.black,
      inactiveTrackColor: AppColors.subtleLine,
      overlayShape: SliderComponentShape.noOverlay,
      rangeThumbShape: const _FilterRangeThumbShape(),
      thumbColor: AppColors.white,
      rangeTrackShape: const RoundedRectRangeSliderTrackShape(),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'PRICE',
          style: GoogleFonts.bebasNeue(
            fontSize: 26,
            fontWeight: FontWeight.w400,
            color: AppColors.black,
            height: 1,
          ),
        ),
        const SizedBox(height: 18),
        SliderTheme(
          data: sliderTheme,
          child: RangeSlider(
            values: values,
            min: min,
            max: max,
            onChanged: onChanged,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1),
          child: Row(
            children: [
              Text(
                _formatPrice(values.start),
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.lightGray,
                  height: 1,
                ),
              ),
              const Spacer(),
              Text(
                _formatPrice(values.end),
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.lightGray,
                  height: 1,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _FilterRangeThumbShape extends RangeSliderThumbShape {
  const _FilterRangeThumbShape();

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size.square(14);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    bool isDiscrete = false,
    bool isEnabled = false,
    bool isOnTop = false,
    required SliderThemeData sliderTheme,
    TextDirection textDirection = TextDirection.ltr,
    Thumb thumb = Thumb.start,
    bool isPressed = false,
  }) {
    final canvas = context.canvas;
    final fillPaint = Paint()..color = AppColors.white;
    final strokePaint = Paint()
      ..color = AppColors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawCircle(center, 5, fillPaint);
    canvas.drawCircle(center, 5, strokePaint);
  }
}
