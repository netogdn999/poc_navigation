import 'dart:convert';

import 'package:finance/private/core/entity/failure.dart';
import 'package:finance/private/core/entity/finance_client.dart';
import 'package:finance/private/core/entity/response.dart';

import '../../model/income_statement_account_model.dart';
import '../income_statement_account_repository_interface.dart';

class RemoteIncomeStatementAccountFetchAllExpensesRepositoryImpl implements IncomeStatementAccountFetchAllExpensesRepository {
  @override
  Future<Response<Failure, List<IncomeStatementAccountModel>>> call() async {
    try {
      final response = await get(
        path: "/incomeStatementAccount/expense",
      );
      if (response.statusCode == FinanceStatusCode.ok.code) {
        final Map<String, dynamic> responseJson = jsonDecode(response.body);
        final List jsonList = responseJson['body'];
        final result = jsonList.map((json) => IncomeStatementAccountModel.fromJson(json)).toList();
        return Response(body: result);
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
