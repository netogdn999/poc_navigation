import 'package:finance/private/core/entity/failure.dart';
import 'package:finance/private/core/entity/finance_client.dart';
import 'package:finance/private/core/entity/response.dart';

import '../../model/income_statement_account_type_register_model.dart';
import '../income_statement_account_type_repository_interface.dart';

class RemoteIncomeStatementAccountTypeCreateRepositoryImpl implements IncomeStatementAccountTypeCreateRepository {

  @override
  Future<Response<Failure, Unit>> call(int category2Id, IncomeStatementAccountTypeRegisterModel model) async {
    try {
      final response = await post(
        path: "/category2/$category2Id/registerIncomeStatementAccountType",
        body: model.toJson(),
      );
      if (response.statusCode == FinanceStatusCode.ok.code) {
        return const Response(
          body: unit
        );
      }

      return Response(
        error: ResquestError(response.body)
      );
    } catch (ex) {
      return Response(
        error: ResquestError(ex.toString())
      );
    }
  }
}
