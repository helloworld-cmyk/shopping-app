import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../theme/color.dart';

class ExpandableDescription extends StatelessWidget {
  final List<String> detailImages;

  const ExpandableDescription({
    super.key,
    required this.detailImages,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            'DESCRIPTION',
            style: GoogleFonts.bebasNeue(
              fontSize: 26,
              color: AppColors.black,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            'Purus in massa tempor nec feugiat. Congue nisi vitae suscipit tellus mauris a diam. Nam aliquam sem et tortor. Quis risus sed vulputate odio ut enim. Ultrices dui sapien eget mi proin sed libero enim sed.\n\nQuis viverra nibh cras pulvinar mattis nunc sed blandit libero. At volutpat diam ut venenatis tellus in.',
            style: GoogleFonts.poppins(
              color: AppColors.mediumGray,
              fontSize: 12,
              height: 1.6,
            ),
          ),
        ),
        const SizedBox(height: 24),
        ...detailImages.map((image) => Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Image.asset(
                image,
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),
            )),
        Center(
          child: TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.keyboard_arrow_down, color: AppColors.mediumGray),
            label: Text(
              'Show More',
              style: GoogleFonts.poppins(
                color: AppColors.mediumGray,
                fontSize: 10,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
