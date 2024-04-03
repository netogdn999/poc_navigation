import 'dart:convert';

import 'package:finance/private/core/entity/failure.dart';
import 'package:finance/private/core/entity/response.dart';

import '../../model/income_statement_account_type_fetch_model.dart';
import '../income_statement_account_type_repository_interface.dart';

class MockIncomeStatementAccountTypeFetchAllByCategory2RepositoryImpl implements IncomeStatementAccountTypeFetchAllByCategory2Repository {

  @override
  Future<Response<Failure, List<IncomeStatementAccountTypeFetchModel>>> call(int category2Id) async {
    try {
      final response = jsonDecode(_mockJson);
      final List jsonList = response['body'];
      final result = jsonList.map((json) => IncomeStatementAccountTypeFetchModel.fromJson(json)).toList();
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
          "id": 4,
          "name": "HBO",
          "is_expense": true
        },
        {
          "id": 0,
          "name": "Amazon prime",
          "is_expense": true
        },
        {
          "id": 2,
          "name": "Rico Trader",
          "is_expense": true
        },
        {
          "id": 3,
          "name": "Disney",
          "is_expense": true
        },
        {
          "id": 5,
          "name": "Netflix",
          "is_expense": true
        },
        {
          "id": 6,
          "name": "Spotify",
          "is_expense": true
        }
      ]
    }
  """;
}
