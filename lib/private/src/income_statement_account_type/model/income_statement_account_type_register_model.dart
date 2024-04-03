import 'package:finance/private/core/entity/income_statement_account_type.dart';

class IncomeStatementAccountTypeRegisterModel extends IncomeStatementAccountType {
  final String name;
  final bool isExpense;

  const IncomeStatementAccountTypeRegisterModel({required this.name, required this.isExpense});

  Map<String, dynamic> toJson() => {
    'name': name,
    'is_expense': isExpense,
  };
}