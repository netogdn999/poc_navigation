import 'package:finance/private/core/constants/colors.dart';
import 'package:finance/private/core/constants/sizes.dart';
import 'package:finance/private/core/widgets/my_app_bar.dart';
import 'package:finance/private/navigation/base_routes.dart';
import 'package:finance/private/navigation/navigation_actions.dart';
import 'package:finance/pages/category1_fetch/presentantion/pages/category1_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String title;
  final routes = [
    BaseRoutes.expenseRecord,
    BaseRoutes.listIncomeStatementAccount,
    BaseRoutes.typeRecord,
    BaseRoutes.category2Record,
    BaseRoutes.category1Record,
    BaseRoutes.institutionGroupRecord,
    BaseRoutes.institutionRecord,
  ];

  HomePage({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const ValueKey(BaseRoutes.home),
      appBar: MyAppBar(
        title: title,
      ),
      body: ListView.separated(
        itemCount: routes.length,
        itemBuilder: (_, index) {
          final item = routes[index];
          return ListTile(
            onTap: () => NavigationAction.of(context).navigate(item),
            title: Text(item.name),
          );
        },
        separatorBuilder: (_, __) => Divider(
          height: AppSizes.defaultListTileDiverIndent.vertical,
          indent: AppSizes.defaultListTileDiverIndent.horizontal,
        ),
      ),
      bottomSheet: const MyBottomSheet(),
    );
  }
}

class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * AppSizes.defaultBottomSheetHeight.all,
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
      child: Column(children: [
        const Center(
          child: Text("Categorias"),
        ),
        SizedBox(height: AppSizes.defaultPadding.all),
        const Expanded(
          child: Category1Page(),
        ),
      ]),
    );
  }
}