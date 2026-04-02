import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/color.dart';
import '../searchfilter_mock_data.dart';

class FilterCategorySection extends StatelessWidget {
  const FilterCategorySection({
    super.key,
    required this.groups,
    required this.expandedTitle,
    required this.selectedItem,
    required this.onGroupTap,
    required this.onItemTap,
  });

  final List<SearchFilterCategoryGroup> groups;
  final String expandedTitle;
  final String selectedItem;
  final ValueChanged<String> onGroupTap;
  final ValueChanged<String> onItemTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: groups.map((group) {
        final isExpanded = group.title == expandedTitle;
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => onGroupTap(group.title),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          group.title,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: isExpanded
                                ? FontWeight.w500
                                : FontWeight.w400,
                            color: isExpanded
                                ? AppColors.primary
                                : AppColors.black,
                            height: 1.2,
                          ),
                        ),
                      ),
                      Icon(
                        isExpanded
                            ? Icons.keyboard_arrow_down
                            : Icons.chevron_right,
                        size: 18,
                        color: isExpanded
                            ? AppColors.black
                            : AppColors.darkGray,
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(height: 1, thickness: 1, color: AppColors.border),
              if (isExpanded) ...[
                const SizedBox(height: 14),
                ...group.items.map(
                  (item) => InkWell(
                    onTap: () => onItemTap(item),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Text(
                        item,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: item == selectedItem
                              ? FontWeight.w500
                              : FontWeight.w400,
                          color: item == selectedItem
                              ? AppColors.mediumGray
                              : AppColors.lightGray,
                          height: 1.2,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 2),
              ],
            ],
          ),
        );
      }).toList(),
    );
  }
}
