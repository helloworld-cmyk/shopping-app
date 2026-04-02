import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/color.dart';

class FilterColorSection extends StatelessWidget {
  const FilterColorSection({
    super.key,
    required this.colors,
    required this.selectedColor,
    required this.onColorSelected,
  });

  final List<Color> colors;
  final Color selectedColor;
  final ValueChanged<Color> onColorSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'COLOR',
          style: GoogleFonts.bebasNeue(
            fontSize: 26,
            fontWeight: FontWeight.w400,
            color: AppColors.black,
            height: 1,
          ),
        ),
        const SizedBox(height: 18),
        Wrap(
          spacing: 14,
          runSpacing: 12,
          children: colors.map((color) {
            final isSelected = color == selectedColor;
            return InkWell(
              onTap: () => onColorSelected(color),
              borderRadius: BorderRadius.circular(18),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 160),
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  border: isSelected
                      ? Border.all(color: AppColors.black, width: 1.5)
                      : null,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
