import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../theme/color.dart';
import 'review_form_bloc.dart';
import 'review_form_event.dart';
import 'review_form_state.dart';

class ReviewsSection extends StatelessWidget {
  final List<Map<String, dynamic>> reviews;

  const ReviewsSection({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ReviewFormBloc(),
      child: BlocConsumer<ReviewFormBloc, ReviewFormState>(
        listener: (context, state) {
          if (state.successMessage != null) {
            FocusScope.of(context).unfocus();
          }
        },
        builder: (context, state) {
          final ReviewFormBloc bloc = context.read<ReviewFormBloc>();

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Form(
              key: bloc.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${reviews.length} REVIEWS FOR SLIT DENIM SKIRT',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 22,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ...reviews.map((review) => _ReviewItem(review: review)),
                  const SizedBox(height: 40),
                  Text(
                    'ADD A REVIEW',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 22,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _CustomTextField(
                    label: 'Your review *',
                    controller: bloc.reviewController,
                    maxLines: 3,
                    validator: bloc.validateReview,
                  ),
                  const SizedBox(height: 16),
                  _CustomTextField(
                    label: 'Name *',
                    controller: bloc.nameController,
                    validator: bloc.validateName,
                  ),
                  const SizedBox(height: 16),
                  _CustomTextField(
                    label: 'Email *',
                    controller: bloc.emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: bloc.validateEmail,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        'Your Rating *',
                        style: GoogleFonts.poppins(
                          color: AppColors.mediumGray,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(5, (index) {
                          final bool isSelected = index < state.rating;

                          return Padding(
                            padding: EdgeInsets.only(
                              right: index == 4 ? 0 : 2,
                            ),
                            child: GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                context.read<ReviewFormBloc>().add(
                                  ReviewRatingChanged(index + 1),
                                );
                              },
                              child: SizedBox(
                                width: 20,
                                height: 20,
                                child: Icon(
                                  isSelected
                                      ? Icons.star
                                      : Icons.star_border,
                                  color: isSelected
                                      ? const Color(0xFFFFD700)
                                      : AppColors.extraLightGray,
                                  size: 18,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                  if (state.ratingError != null) ...[
                    const SizedBox(height: 6),
                    Text(
                      state.ratingError!,
                      style: GoogleFonts.poppins(
                        color: Colors.red,
                        fontSize: 11,
                      ),
                    ),
                  ],
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Checkbox(
                        value: state.saveDetails,
                        activeColor: AppColors.primary,
                        onChanged: (value) {
                          context.read<ReviewFormBloc>().add(
                            ReviewSaveDetailsChanged(value ?? false),
                          );
                        },
                      ),
                      Expanded(
                        child: Text(
                          'Save my name, email, and website in this browser for the next time I comment.',
                          style: GoogleFonts.poppins(
                            color: AppColors.mediumGray,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: state.successMessage == null
                        ? const SizedBox.shrink()
                        : Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE9F8EE),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: const Color(0xFFBFE8C8),
                              ),
                            ),
                            child: Text(
                              state.successMessage!,
                              style: GoogleFonts.poppins(
                                color: const Color(0xFF1F7A3D),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: SizedBox(
                      width: 140,
                      height: 45,
                      child: OutlinedButton(
                        onPressed: () {
                          context.read<ReviewFormBloc>().add(
                            const ReviewSubmitted(),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xFFE8E8E8)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22),
                          ),
                        ),
                        child: Text(
                          'SUBMIT',
                          style: GoogleFonts.bebasNeue(
                            fontSize: 18,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ReviewItem extends StatelessWidget {
  final Map<String, dynamic> review;

  const _ReviewItem({required this.review});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(radius: 24, backgroundImage: AssetImage(review['avatar'])),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: List.generate(
                  5,
                  (index) => Icon(
                    index < review['rating'] ? Icons.star : Icons.star_border,
                    color: const Color(0xFFFFD700),
                    size: 16,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    review['userName'],
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text('—'),
                  const SizedBox(width: 8),
                  Text(
                    review['date'],
                    style: GoogleFonts.poppins(
                      color: AppColors.mediumGray,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                review['comment'],
                style: GoogleFonts.poppins(
                  color: AppColors.mediumGray,
                  fontSize: 12,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CustomTextField extends StatelessWidget {
  final String label;
  final int maxLines;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  const _CustomTextField({
    required this.label,
    required this.controller,
    this.validator,
    this.keyboardType,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(color: AppColors.mediumGray, fontSize: 12),
        ),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: keyboardType,
          validator: validator,
          decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(vertical: 8),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE8E8E8)),
            ),
          ),
        ),
      ],
    );
  }
}
