import 'package:finance/private/core/entity/income_statement_account_type.dart';

class IncomeStatementAccountTypeFetchModel extends IncomeStatementAccountType {
  final int id;
  final String name;

  const IncomeStatementAccountTypeFetchModel({required this.id, required this.name});

  factory IncomeStatementAccountTypeFetchModel.fromJson(Map<String, dynamic> json) {
    return IncomeStatementAccountTypeFetchModel(
      id: json['id'],
      name: json['name'],
    );
  }
}