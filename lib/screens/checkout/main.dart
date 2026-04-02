import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../bloc/myorderBloc/bloc.dart';
import '../../bloc/myorderBloc/event.dart';
import '../../router/app_router.dart';
import '../../theme/color.dart';
import '../../widgets/common_app_bar.dart';
import '../../widgets/cart_progress.dart';
import '../../bloc/cartBloc/bloc.dart';
import 'widget/checkout_address_section.dart';
import 'widget/order_now_button.dart';
import 'widget/payment_method_section.dart';
import 'widget/order_item_tile.dart';
import 'widget/coupon_section.dart';

@RoutePage()
class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            CommonAppBar(
              title: 'CHECKOUT',
              onBack: () => context.router.maybePop(),
            ),
            Expanded(
              child: BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return Stack(
                    children: [
                      SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            const SizedBox(height: 16),
                            const CartProgressStepper(currentStep: 1),
                            const SizedBox(height: 32),
                            const CheckoutAddressSection(),
                            const PaymentMethodSection(),
                            const SizedBox(height: 8),
                            // Order Summary List
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 25.0,
                              ),
                              child: Column(
                                children: state.items.map((item) {
                                  return Column(
                                    children: [
                                      OrderItemTile(
                                        image: item.image,
                                        title: item.name,
                                        price: item.price,
                                        quantity: item.quantity,
                                      ),
                                      const Divider(
                                        color: Color(0xFFE9E9E9),
                                        height: 1,
                                      ),
                                    ],
                                  );
                                }).toList(),
                              ),
                            ),
                            const CouponSection(),
                            const SizedBox(height: 24),
                            // Total Section
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 25.0,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total',
                                    style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.black,
                                    ),
                                  ),
                                  Text(
                                    '\$ ${state.totalAmount.toStringAsFixed(2)}',
                                    style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.primary,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 120),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 25,
                        right: 25,
                        bottom: MediaQuery.of(context).padding.bottom + 16,
                        child: OrderNowButton(
                          onPressed: () {
                            if (state.items.isEmpty) {
                              return;
                            }

                            context.read<MyOrderBloc>().add(
                              PlaceOrder(List.of(state.items)),
                            );
                            context.router.push(const SuccessRoute());
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
