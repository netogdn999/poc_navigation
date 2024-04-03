import 'package:finance/private/core/entity/failure.dart';
import 'package:finance/private/core/entity/response.dart';

import '../../model/income_statement_account_record_model.dart';
import '../income_statement_account_repository_interface.dart';

class MockIncomeStementAccountCreateRepositoryImpl implements IncomeStatementAccountCreateRepository {
  @override
  Future<Response<Failure, Unit>> call(int institutionId, IncomeStatementAccountRecordModel model) async {
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
