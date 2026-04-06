import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../bloc/cartBloc/bloc.dart';
import '../../../bloc/cartBloc/cart_item.dart';
import '../../../bloc/wishlistBloc/bloc.dart';
import '../../../bloc/wishlistBloc/event.dart';
import '../../../models/wishlist_item_model.dart';
import '../../../theme/color.dart';
import '../../../widgets/add_to_cart_success_modal.dart';

class StickyBottomBar extends StatelessWidget {
  final String id;
  final String name;
  final String image;
  final double price;

  const StickyBottomBar({
    super.key,
    required this.id,
    required this.name,
    required this.image,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final bool isWishlisted = context.select<WishlistBloc, bool>(
      (bloc) => bloc.state.contains(id),
    );

    return Container(
      padding: EdgeInsets.fromLTRB(
        25,
        12,
        25,
        MediaQuery.of(context).padding.bottom + 12,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            offset: const Offset(0, -4),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        children: [
          Text(
            '\$ ${price.toStringAsFixed(2)}',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
          ),
          const SizedBox(width: 12),
          Container(height: 30, width: 1, color: const Color(0xFFE8E8E8)),
          const SizedBox(width: 12),
          IconButton(
            onPressed: () {
              context.read<WishlistBloc>().add(
                ToggleWishlistItem(
                  WishlistItem(id: id, name: name, image: image, price: price),
                ),
              );
            },
            icon: Icon(
              isWishlisted ? Icons.favorite : Icons.favorite_border,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  context.read<CartBloc>().add(
                    AddToCart(
                      CartItem(id: id, name: name, image: image, price: price),
                    ),
                  );
                  showAddToCartSuccess(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Add To Cart',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
