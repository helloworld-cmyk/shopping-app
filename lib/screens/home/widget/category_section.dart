import 'package:flutter/material.dart';
import '../../../theme/color.dart';
import 'section_title.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'name': 'Men', 'image': 'lib/assets/home/maskgroup1.png', 'isAsset': 'true'},
      {'name': 'Women', 'image': 'lib/assets/home/maskgroup2.png', 'isAsset': 'true'},
      {'name': 'Kids', 'image': 'lib/assets/home/maskgroup3.png', 'isAsset': 'true'},
      {'name': 'Bags', 'image': 'lib/assets/home/maskgroup4.png', 'isAsset': 'true'},
      {'name': 'Shoes', 'image': 'https://picsum.photos/100/100?random=6', 'isAsset': 'false'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(
          title: 'CATEGORIES',
          actionText: 'All Categories',
          onActionTap: () {},
        ),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Column(
                  children: [
                    Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: categories[index]['isAsset'] == 'true'
                              ? AssetImage(categories[index]['image']!) as ImageProvider
                              : NetworkImage(categories[index]['image']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      categories[index]['name']!,
                      style: TextStyle(
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
