import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../theme/color.dart';
import '../../widgets/common_app_bar.dart';
import 'widget/card_preview.dart';
import 'widget/card_form_section.dart';
import 'widget/add_card_button.dart';

@RoutePage()
class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  final _nameController = TextEditingController();
  final _cardNumberController = TextEditingController();
  final _expMonthController = TextEditingController();
  final _expDateController = TextEditingController();
  final _cvvController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Listen to text changes to update the card preview in real-time
    _nameController.addListener(_onFieldChanged);
    _cardNumberController.addListener(_onFieldChanged);
    _expMonthController.addListener(_onFieldChanged);
    _expDateController.addListener(_onFieldChanged);
  }

  void _onFieldChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    _nameController.dispose();
    _cardNumberController.dispose();
    _expMonthController.dispose();
    _expDateController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            CommonAppBar(
              title: 'ADD NEW CARD',
              onBack: () => context.router.maybePop(),
            ),
            Expanded(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),

                        // ── Card Preview ──
                        CardPreview(
                          cardNumber: _cardNumberController.text,
                          cardHolder: _nameController.text,
                          expMonth: _expMonthController.text,
                          expDate: _expDateController.text,
                        ),

                        const SizedBox(height: 36),

                        // ── Form Fields ──
                        CardFormSection(
                          nameController: _nameController,
                          cardNumberController: _cardNumberController,
                          expMonthController: _expMonthController,
                          expDateController: _expDateController,
                          cvvController: _cvvController,
                        ),

                        // Bottom padding for the floating button
                        const SizedBox(height: 100),
                      ],
                    ),
                  ),

                  // ── Floating Add Card button ──
                  Positioned(
                    left: 25,
                    right: 25,
                    bottom: MediaQuery.of(context).padding.bottom + 16,
                    child: AddCardButton(
                      onPressed: () {
                        // Handle add card action
                        context.router.maybePop();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
