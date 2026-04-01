import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/color.dart';

class CommonAppBar extends StatelessWidget {
  const CommonAppBar({
    super.key,
    required this.title,
    this.onBack,
    this.actions,
  });

  final String title;
  final VoidCallback? onBack;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.of(context).padding.top;

    return Padding(
      padding: EdgeInsets.fromLTRB(16, topInset + 8, 16, 22),
      child: Row(
        children: [
          SizedBox(
            width: 40,
            height: 40,
            child: onBack != null
                ? IconButton(
                    padding: EdgeInsets.zero,
                    splashRadius: 20,
                    onPressed: onBack,
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 16,
                      color: AppColors.black,
                    ),
                  )
                : const SizedBox.shrink(),
          ),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.bebasNeue(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                letterSpacing: 0,
                height: 1.0,
                color: AppColors.black,
              ),
            ),
          ),
          SizedBox(
            width: actions != null ? null : 40,
            child: actions != null
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: actions!,
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
