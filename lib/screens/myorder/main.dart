import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/myorderBloc/bloc.dart';
import '../../bloc/myorderBloc/state.dart';
import '../../router/app_router.dart';
import '../../theme/color.dart';
import '../../widgets/common_app_bar.dart';
import '../wishlist/mock_data.dart';
import '../wishlist/widget/wishlist_recommendations_section.dart';
import '../wishlist/widget/wishlist_tab_switcher.dart';
import 'widget/my_order_item_tile.dart';

@RoutePage()
class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyOrderBloc, MyOrderState>(
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
                    title: 'MY ORDER',
                    onBack: () => context.router.maybePop(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: WishlistTabSwitcher(
                      selectedTab: WishlistTabs.myOrder,
                      onWishlistTap: () =>
                          context.router.push(const WishlistRoute()),
                    ),
                  ),
                  const SizedBox(height: 26),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: state.items.isEmpty
                        ? const _EmptyOrderState()
                        : Column(
                            children: List<Widget>.generate(
                              state.items.length,
                              (int index) {
                                final MyOrderItem item = state.items[index];

                                return Padding(
                                  padding: EdgeInsets.only(
                                    bottom: index == state.items.length - 1
                                        ? 0
                                        : 30,
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      MyOrderItemTile(
                                        name: item.name,
                                        image: item.image,
                                        price: item.priceLabel,
                                        quantity: item.quantity,
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

class _EmptyOrderState extends StatelessWidget {
  const _EmptyOrderState();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        'You have no orders yet. Complete checkout to see your items here.',
        style: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(color: AppColors.mediumGray),
      ),
    );
  }
}
