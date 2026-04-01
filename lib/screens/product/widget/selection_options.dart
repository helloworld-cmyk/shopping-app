import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../theme/color.dart';

class SelectionOptions extends StatefulWidget {
  final List<Color> colors;
  final List<String> sizes;

  const SelectionOptions({
    super.key,
    required this.colors,
    required this.sizes,
  });

  @override
  State<SelectionOptions> createState() => _SelectionOptionsState();
}

class _SelectionOptionsState extends State<SelectionOptions> {
  Color? _selectedColor;
  String? _selectedSize;

  @override
  void initState() {
    super.initState();
    _selectedColor = widget.colors.first;
    _selectedSize = widget.sizes.first;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Color:',
            style: GoogleFonts.bebasNeue(
              fontSize: 20,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: widget.colors.map((color) {
              final isSelected = _selectedColor == color;
              return GestureDetector(
                onTap: () => setState(() => _selectedColor = color),
                child: Container(
                  margin: const EdgeInsets.only(right: 12),
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                    border: isSelected
                        ? Border.all(color: AppColors.primary, width: 2)
                        : null,
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 24),
          Text(
            'Size:',
            style: GoogleFonts.bebasNeue(
              fontSize: 20,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: widget.sizes.map((size) {
              final isSelected = _selectedSize == size;
              return GestureDetector(
                onTap: () => setState(() => _selectedSize = size),
                child: Container(
                  margin: const EdgeInsets.only(right: 12),
                  width: 45,
                  height: 35,
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.black : AppColors.white,
                    border: Border.all(color: const Color(0xFFE8E8E8)),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    size,
                    style: GoogleFonts.poppins(
                      color: isSelected ? AppColors.white : AppColors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
