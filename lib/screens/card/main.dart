import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../theme/color.dart';
import '../../widgets/common_app_bar.dart';
import 'card_mock_data.dart';
import 'widget/add_new_card_button.dart';
import 'widget/payment_card_item.dart';

import '../../router/app_router.dart';

@RoutePage()
class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  String? _selectedCardId = '1';

  @override
  void initState() {
    super.initState();
    if (mockCards.isNotEmpty) {
      _selectedCardId = mockCards.first.id;
    }
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
              title: 'PAYMENT METHOD',
              onBack: () => context.router.maybePop(),
            ),
            Expanded(
              child: Stack(
                children: [
                  ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.fromLTRB(25, 10, 25, 100),
                    itemCount: mockCards.length,
                    itemBuilder: (context, index) {
                      final card = mockCards[index];
                      return PaymentCardItem(
                        cardInfo: card,
                        isSelected: _selectedCardId == card.id,
                        onTap: () {
                          setState(() {
                            _selectedCardId = card.id;
                          });
                        },
                      );
                    },
                  ),

                  // Bottom button
                  Positioned(
                    left: 25,
                    right: 25,
                    bottom: MediaQuery.of(context).padding.bottom + 16,
                    child: AddNewCardButton(
                      onPressed: () {
                        context.router.push(const AddCardRoute());
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
