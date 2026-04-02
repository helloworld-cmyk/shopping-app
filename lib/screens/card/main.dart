import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cardBloc/bloc.dart';
import '../../bloc/cardBloc/event.dart';
import '../../bloc/cardBloc/state.dart';
import '../../router/app_router.dart';
import '../../theme/color.dart';
import '../../widgets/common_app_bar.dart';
import 'widget/add_new_card_button.dart';
import 'widget/payment_card_item.dart';

@RoutePage()
class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

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
                  BlocBuilder<CardBloc, CardState>(
                    builder: (context, state) {
                      if (state.cards.isEmpty) {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Text(
                              'No payment card yet. Add a new card to continue.',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(color: const Color(0xFF8F8F8F)),
                            ),
                          ),
                        );
                      }

                      return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.fromLTRB(25, 10, 25, 100),
                        itemCount: state.cards.length,
                        itemBuilder: (context, index) {
                          final card = state.cards[index];
                          return PaymentCardItem(
                            cardInfo: card,
                            isSelected: state.selectedCardId == card.id,
                            onTap: () {
                              context.read<CardBloc>().add(SelectCard(card.id));
                            },
                          );
                        },
                      );
                    },
                  ),

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
