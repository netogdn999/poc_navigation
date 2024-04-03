import 'package:finance/private/core/entity/failure.dart';
import 'package:finance/private/core/entity/response.dart';

import '../model/income_statement_account_type_fetch_model.dart';
import '../model/income_statement_account_type_register_model.dart';


abstract class IncomeStatementAccountTypeCreateRepository {
  Future<Response<Failure, Unit>> call(int category2Id, IncomeStatementAccountTypeRegisterModel model);
}

abstract class IncomeStatementAccountTypeFetchAllByCategory2Repository {
  Future<Response<Failure, List<IncomeStatementAccountTypeFetchModel>>> call(int category2Id);
}
