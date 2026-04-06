import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cartBloc/bloc.dart';
import '../../bloc/cartBloc/cart_item.dart';
import '../../bloc/wishlistBloc/bloc.dart';
import '../../bloc/wishlistBloc/event.dart';
import '../../bloc/wishlistBloc/state.dart';
import '../../models/wishlist_item_model.dart';
import '../../router/app_router.dart';
import '../../theme/color.dart';
import '../../widgets/common_app_bar.dart';
import '../../widgets/add_to_cart_success_modal.dart';
import 'mock_data.dart';
import 'widget/wishlist_item_tile.dart';
import 'widget/wishlist_recommendations_section.dart';
import 'widget/wishlist_tab_switcher.dart';

@RoutePage()
class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistBloc, WishlistState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.white,
          body: SafeArea(
            top: false,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CommonAppBar(
                    title: 'WISHLIST',
                    onBack: () => context.router.maybePop(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: WishlistTabSwitcher(
                      selectedTab: WishlistTabs.wishlist,
                      onOrderTap: () =>
                          context.router.push(const MyOrderRoute()),
                    ),
                  ),
                  const SizedBox(height: 26),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: state.items.isEmpty
                        ? const _EmptyWishlistState()
                        : Column(
                            children: List<Widget>.generate(
                              state.items.length,
                              (int index) {
                                final WishlistItem item = state.items[index];

                                return Padding(
                                  padding: EdgeInsets.only(
                                    bottom: index == state.items.length - 1
                                        ? 0
                                        : 30,
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      WishlistItemTile(
                                        name: item.name,
                                        image: item.image,
                                        price: item.priceLabel,
                                        onCartTap: () {
                                          context.read<CartBloc>().add(
                                            AddToCart(
                                              CartItem(
                                                id: item.id,
                                                name: item.name,
                                                image: item.image,
                                                price: item.price,
                                              ),
                                            ),
                                          );
                                          showAddToCartSuccess(context);
                                        },
                                        onRemoveTap: () {
                                          context.read<WishlistBloc>().add(
                                            RemoveWishlistItem(item.id),
                                          );
                                        },
                                      ),
                                      if (index !=
                                          state.items.length - 1) ...<Widget>[
                                        const SizedBox(height: 28),
                                        const Divider(
                                          height: 1,
                                          thickness: 1,
                                          color: AppColors.subtleLine,
                                        ),
                                      ],
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                  ),
                  const SizedBox(height: 44),
                  const WishlistRecommendationsSection(
                    products: wishlistRecommendations,
                  ),
                  const SizedBox(height: 36),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _EmptyWishlistState extends StatelessWidget {
  const _EmptyWishlistState();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        'Your wishlist is empty. Tap the heart on a product to save it here.',
        style: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(color: AppColors.mediumGray),
      ),
    );
  }
}
