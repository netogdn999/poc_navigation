import 'package:finance/private/core/constants/sizes.dart';
import 'package:finance/private/core/widgets/my_app_bar.dart';
import 'package:finance/private/navigation/base_routes.dart';
import 'package:finance/private/navigation/navigation_actions.dart';
import 'package:flutter/material.dart';

class IncomeStatementAccountGender extends StatelessWidget {
  final String title;
  final List<MapEntry<SubRoutes, dynamic>> incomeStatementAccountGenders = const [
    MapEntry(SubRoutes.incomeStatementAccountDetails, {"isExpense": false}),
    MapEntry(SubRoutes.incomeStatementAccountDetails, {"isExpense": true}),
  ];
  final List<String> options = const [
    "expenses",
    "incomes"
  ];

  const IncomeStatementAccountGender({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: title),
      body: ListView.separated(
        itemCount: incomeStatementAccountGenders.length,
        itemBuilder: (_, index) {
          final item = incomeStatementAccountGenders[index];
          final option = options[index];
          return ListTile(
            title: Text(option),
            onTap: () => NavigationAction.of(context).navigate(item.key, params: item.value),
          );
        },
        separatorBuilder: (_, __) => Divider(
          height: AppSizes.defaultListTileDiverIndent.vertical,
          indent: AppSizes.defaultListTileDiverIndent.horizontal,
        ),
      ),
    );
  }
}