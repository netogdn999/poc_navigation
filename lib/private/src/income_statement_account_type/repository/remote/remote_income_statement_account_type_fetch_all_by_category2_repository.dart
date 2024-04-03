import 'dart:convert';

import 'package:finance/private/core/entity/failure.dart';
import 'package:finance/private/core/entity/finance_client.dart';
import 'package:finance/private/core/entity/response.dart';

import '../../model/income_statement_account_type_fetch_model.dart';
import '../income_statement_account_type_repository_interface.dart';

class RemoteIncomeStatementAccountTypeFetchAllByCategory2RepositoryImpl implements IncomeStatementAccountTypeFetchAllByCategory2Repository {

  @override
  Future<Response<Failure, List<IncomeStatementAccountTypeFetchModel>>> call(int category2Id) async {
    try {
      final response = await get(path: "/category2/$category2Id/incomeStatementAccountTypes");
      if(response.statusCode == FinanceStatusCode.ok.code) {
        final Map<String, dynamic> responseJson = jsonDecode(response.body);
        final List jsonList = responseJson['body'];
        final result = jsonList.map((json) => IncomeStatementAccountTypeFetchModel.fromJson(json)).toList();
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
