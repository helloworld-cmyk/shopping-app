import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/color.dart';

class FilterHeader extends StatelessWidget {
  const FilterHeader({super.key, required this.onClose});

  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            'FILTER',
            style: GoogleFonts.bebasNeue(
              fontSize: 29,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
              height: 1,
            ),
          ),
        ),
        InkWell(
          onTap: onClose,
          child: const Padding(
            padding: EdgeInsets.all(4),
            child: Icon(Icons.close, size: 20, color: AppColors.black),
          ),
        ),
      ],
    );
  }
}
