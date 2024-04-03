import 'package:finance/private/core/entity/failure.dart';
import 'package:finance/private/core/entity/response.dart';

import '../../model/income_statement_account_type_register_model.dart';
import '../income_statement_account_type_repository_interface.dart';

class MockIncomeStatementAccountTypeCreateRepositoryImpl implements IncomeStatementAccountTypeCreateRepository {

  @override
  Future<Response<Failure, Unit>> call(int category2Id, IncomeStatementAccountTypeRegisterModel model) async {
    try {
      return const Response(
        body: unit
      );
    } catch (ex) {
      return Response(
        error: ResquestError(ex.toString())
      );
    }
  }
}
