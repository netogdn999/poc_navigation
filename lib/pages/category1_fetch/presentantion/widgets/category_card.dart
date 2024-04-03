import 'package:finance/private/core/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../private/src/category1/model/category1_fetch_with_average_model.dart';
import 'category_chart.dart';

class CategoryCard extends StatelessWidget {
  final Category1FetchWithAverageModel category;
  final void Function(Category1FetchWithAverageModel category) onItemClick;
  const CategoryCard({super.key, required this.category, required this.onItemClick});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => onItemClick(category),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: AppSizes.defaultPadding.all),
            Hero(
              tag: category.name,
              child: Container(
                constraints: const BoxConstraints(
                  maxHeight: 180,
                  maxWidth: 240,
                ),
                child: IgnorePointer(
                  child: CategoryChart(
                    category: category,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
