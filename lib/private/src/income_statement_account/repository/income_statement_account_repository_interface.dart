import 'package:finance/private/core/entity/failure.dart';
import 'package:finance/private/core/entity/response.dart';

import '../model/income_statement_account_model.dart';
import '../model/income_statement_account_record_model.dart';

abstract class IncomeStatementAccountCreateRepository {
  Future<Response<Failure, Unit>> call(int institutionId, IncomeStatementAccountRecordModel model);
}

abstract class IncomeStatementAccountFetchAllExpensesRepository {
  Future<Response<Failure, List<IncomeStatementAccountModel>>> call();
}

abstract class IncomeStatementAccountFetchAllIncomesRepository {
  Future<Response<Failure, List<IncomeStatementAccountModel>>> call();
}
