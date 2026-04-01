import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../router/app_router.dart';
import '../../../theme/color.dart';
import '../../../widgets/common_app_bar.dart';
import '../../../widgets/cart_progress.dart';
import '../../../bloc/cartBloc/bloc.dart';
import 'widget/cart_item_tile.dart';
import 'widget/proceed_to_checkout_button.dart';
import 'widget/you_also_viewed_section.dart';

@RoutePage()
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.white,
          body: SafeArea(
            top: false,
            child: Stack(
              children: [
                Column(
                  children: [
                    CommonAppBar(
                      title: 'CART',
                      onBack: () => context.router.maybePop(),
                    ),
                    Expanded(
                      child: state.items.isEmpty
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.shopping_cart_outlined,
                                    size: 80,
                                    color: Color(0xFFE0E0E0),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'Your cart is empty',
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      color: const Color(0xFF8A8A8A),
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  ElevatedButton(
                                    onPressed: () => context.router.navigate(
                                      const HomeRoute(),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primary,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                    ),
                                    child: const Text('Go Shopping'),
                                  ),
                                ],
                              ),
                            )
                          : SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 16),
                                  const CartProgressStepper(currentStep: 0),
                                  const SizedBox(height: 16),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 25.0,
                                    ),
                                    child: Column(
                                      children: state.items.map((item) {
                                        return CartItemTile(
                                          id: item.id,
                                          image: item.image,
                                          title: item.name,
                                          price: item.price,
                                          quantity: item.quantity,
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                  const SizedBox(height: 32),
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
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 60),
                                  const YouAlsoViewedSection(),
                                  const SizedBox(height: 120),
                                ],
                              ),
                            ),
                    ),
                  ],
                ),
                if (state.items.isNotEmpty)
                  Positioned(
                    left: 25,
                    right: 25,
                    bottom: MediaQuery.of(context).padding.bottom + 16,
                    child: ProceedToCheckoutButton(
                      onPressed: () {
                        context.router.push(const CheckoutRoute());
                      },
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
