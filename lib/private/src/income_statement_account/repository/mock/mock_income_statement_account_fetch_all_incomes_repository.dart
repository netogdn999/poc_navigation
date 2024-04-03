import 'dart:convert';

import 'package:finance/private/core/entity/failure.dart';
import 'package:finance/private/core/entity/response.dart';

import '../../model/income_statement_account_model.dart';
import '../income_statement_account_repository_interface.dart';

class MockIncomeStatementAccountFetchAllIncomesRepositoryImpl implements IncomeStatementAccountFetchAllIncomesRepository {
  @override
  Future<Response<Failure, List<IncomeStatementAccountModel>>> call() async {
    try {
      final response = jsonDecode(_mockJson);
      final List jsonList = response['body'];
      final result = jsonList.map((json) => IncomeStatementAccountModel.fromJson(json)).toList();
      return Response(body: result);

    } catch (ex) {
      return Response(
        error: ResquestError(ex.toString())
      );
    }
  }

  final _mockJson = """
    {
      "code": 200,
      "body": [
        {
          "id": 24,
          "control_date": "2023-05-30T00:00:00Z",
          "value": 10400.0,
          "type": {
            "id": 9,
            "name": "Salário",
            "is_expense": false
          }
        }
      ]
    }
  """;
}
