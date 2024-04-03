import 'package:finance/private/core/entity/income_statement_account.dart';

import 'income_statement_account_type_record_model.dart';

class IncomeStatementAccountRecordModel extends IncomeStatementAccount {
  final DateTime controlDate;
  final double value;
  final IncomeStatementAccountTypeRecordModel type;

  const IncomeStatementAccountRecordModel({required this.controlDate, required this.value, required this.type});

  Map<String, dynamic> toJson() => {
    'control_date': "${controlDate.toLocal().toIso8601String()}Z",
    'value': value,
    'type': type.toJson()
  };
}
