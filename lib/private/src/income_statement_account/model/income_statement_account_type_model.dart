import 'package:finance/private/core/entity/income_statement_account_type.dart';

class IncomeStatementAccountTypeModel extends IncomeStatementAccountType {
  final int id;
  final String name;
  final bool isExpense;

  const IncomeStatementAccountTypeModel({required this.id, required this.name, required this.isExpense});

  factory IncomeStatementAccountTypeModel.fromJson(Map<String, dynamic> json) {
    return IncomeStatementAccountTypeModel(
      id: json['id'],
      name: json['name'],
      isExpense: json['is_expense'],
    );
  }
} 