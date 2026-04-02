import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cardBloc/bloc.dart';
import '../../bloc/cardBloc/event.dart';
import '../../bloc/cardBloc/state.dart';
import '../../theme/color.dart';
import '../../widgets/common_app_bar.dart';
import 'widget/add_card_button.dart';
import 'widget/card_form_section.dart';
import 'widget/card_preview.dart';

@RoutePage()
class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CardBloc>().add(const AddCardFormStarted());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CardBloc, CardState>(
      listenWhen: (previous, current) =>
          previous.addCardStatus != current.addCardStatus ||
          previous.addCardFeedbackMessage != current.addCardFeedbackMessage,
      listener: (context, state) {
        if (state.isAddCardSuccess) {
          context.router.maybePop();
          context.read<CardBloc>().add(const AddCardFeedbackCleared());
          return;
        }

        if (state.isAddCardFailure && state.addCardFeedbackMessage != null) {
          final messenger = ScaffoldMessenger.of(context);
          messenger
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(state.addCardFeedbackMessage!)),
            );
          context.read<CardBloc>().add(const AddCardFeedbackCleared());
        }
      },
      child: Scaffold(
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
                    BlocBuilder<CardBloc, CardState>(
                      buildWhen: (previous, current) =>
                          previous.formCardHolder != current.formCardHolder ||
                          previous.formCardNumber != current.formCardNumber ||
                          previous.formExpMonth != current.formExpMonth ||
                          previous.formExpDate != current.formExpDate ||
                          previous.formCvv != current.formCvv,
                      builder: (context, state) {
                        final cardBloc = context.read<CardBloc>();

                        return SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 4),
                              CardPreview(
                                cardNumber: state.formCardNumber,
                                cardHolder: state.formCardHolder,
                                expMonth: state.formExpMonth,
                                expDate: state.formExpDate,
                              ),
                              const SizedBox(height: 36),
                              CardFormSection(
                                name: state.formCardHolder,
                                cardNumber: state.formCardNumber,
                                expMonth: state.formExpMonth,
                                expDate: state.formExpDate,
                                cvv: state.formCvv,
                                onNameChanged: (value) {
                                  cardBloc.add(
                                    AddCardFieldChanged(
                                      field: AddCardField.cardHolder,
                                      value: value,
                                    ),
                                  );
                                },
                                onCardNumberChanged: (value) {
                                  cardBloc.add(
                                    AddCardFieldChanged(
                                      field: AddCardField.cardNumber,
                                      value: value,
                                    ),
                                  );
                                },
                                onExpMonthChanged: (value) {
                                  cardBloc.add(
                                    AddCardFieldChanged(
                                      field: AddCardField.expMonth,
                                      value: value,
                                    ),
                                  );
                                },
                                onExpDateChanged: (value) {
                                  cardBloc.add(
                                    AddCardFieldChanged(
                                      field: AddCardField.expDate,
                                      value: value,
                                    ),
                                  );
                                },
                                onCvvChanged: (value) {
                                  cardBloc.add(
                                    AddCardFieldChanged(
                                      field: AddCardField.cvv,
                                      value: value,
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(height: 100),
                            ],
                          ),
                        );
                      },
                    ),
                    Positioned(
                      left: 25,
                      right: 25,
                      bottom: MediaQuery.of(context).padding.bottom + 16,
                      child: AddCardButton(
                        onPressed: () {
                          context.read<CardBloc>().add(
                            const AddCardSubmitted(),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
