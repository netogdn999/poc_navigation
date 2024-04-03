
import 'package:finance/private/core/entity/income_statement_account.dart';

import 'income_statement_account_type_model.dart';

class IncomeStatementAccountModel extends IncomeStatementAccount {
  final int id;
  final DateTime controlDate;
  final double value;
  final IncomeStatementAccountTypeModel type;

  const IncomeStatementAccountModel({required this.id, required this.controlDate, required this.value, required this.type});

  factory IncomeStatementAccountModel.fromJson(Map<String, dynamic> json) {
    return IncomeStatementAccountModel(
      id: json['id'],
      controlDate: DateTime.parse(json['control_date']),
      value: json['value'],
      type: IncomeStatementAccountTypeModel.fromJson(json['type']),
    );
  }
}