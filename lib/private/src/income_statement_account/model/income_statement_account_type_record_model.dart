import 'package:finance/private/core/entity/income_statement_account_type.dart';

class IncomeStatementAccountTypeRecordModel extends IncomeStatementAccountType {
  final int id;

  const IncomeStatementAccountTypeRecordModel({required this.id});

  Map<String, dynamic> toJson() => {
    'id': id,
  };
}