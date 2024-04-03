import 'package:finance/pages/category1_fetch/presentantion/widgets/category_chart.dart';
import 'package:finance/private/core/constants/colors.dart';
import 'package:finance/private/core/constants/sizes.dart';
import 'package:finance/private/core/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../../private/src/category1/model/category1_fetch_with_average_model.dart';

class Category1DetailsPage extends StatelessWidget {
  final String title;
  final Category1FetchWithAverageModel category1fetchModel;

  const Category1DetailsPage({
    super.key,
    required this.title,
    required this.category1fetchModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: title),
      body: SizedBox.expand(
        child: Stack(children: [
          Hero(
            tag: category1fetchModel.name,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.defaultPagePadding.horizontal,
                vertical: AppSizes.defaultPagePadding.vertical,
              ),
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.width - 50
                ),
                child: CategoryChart(
                  category: category1fetchModel,
                  showTitle: false,
                ),
              ),
            ),
          ),
          const Category1DetailsBottomSheet(),
        ]),
      ),
    );
  }
}

class Category1DetailsBottomSheet extends StatelessWidget {
  const Category1DetailsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.395,
        minChildSize: 0.395,
        builder: (_, scrollController) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            decoration: BoxDecoration(
              color: AppColors.white.color,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppSizes.defaultBottomSheetBorderTop.radius),
                topRight: Radius.circular(AppSizes.defaultBottomSheetBorderTop.radius),
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: AppSizes.defaultBoxShadow.all,
                )
              ]
            ),
            child: ListView.builder(
              controller: scrollController,
              itemCount: 25,
              itemBuilder: (_, index) {
                return ListTile(title: Text('Item $index'));
              },
            ),
          );
        },
      ),
    );
  }
}