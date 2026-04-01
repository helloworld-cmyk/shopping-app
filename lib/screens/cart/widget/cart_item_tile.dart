import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../theme/color.dart';
import '../../../bloc/cartBloc/bloc.dart';

class CartItemTile extends StatelessWidget {
  final String id;
  final String image;
  final String title;
  final double price;
  final int quantity;

  const CartItemTile({
    super.key,
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.asset(
                  image,
                  width: 70,
                  height: 90,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 70,
                    height: 90,
                    color: Colors.grey[200],
                    child: const Icon(Icons.image_not_supported, color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '\$ ${price.toStringAsFixed(2)}',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove, size: 14),
                      onPressed: () {
                        if (quantity > 1) {
                          context.read<CartBloc>().add(UpdateQuantity(id, quantity - 1));
                        } else {
                          context.read<CartBloc>().add(RemoveFromCart(id));
                        }
                      },
                      constraints: const BoxConstraints(),
                      padding: const EdgeInsets.all(8),
                      splashRadius: 20,
                    ),
                    Text(
                      quantity.toString(),
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add, size: 14),
                      onPressed: () {
                        context.read<CartBloc>().add(UpdateQuantity(id, quantity + 1));
                      },
                      constraints: const BoxConstraints(),
                      padding: const EdgeInsets.all(8),
                      splashRadius: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(color: Color(0xFFE9E9E9), height: 1),
      ],
    );
  }
}
