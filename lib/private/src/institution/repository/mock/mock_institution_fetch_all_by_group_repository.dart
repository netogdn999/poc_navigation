import 'dart:convert';

import 'package:finance/private/core/entity/failure.dart';
import 'package:finance/private/core/entity/response.dart';
import 'package:finance/private/src/institution/model/institution_fetch_model.dart';
import 'package:finance/private/src/institution/repository/institution_repository_interface.dart';

class MockInstitutionFetchAllByGroupRepositoryImpl implements InstitutionFetchAllByGroupRepository {
  @override
  Future<Response<Failure, List<InstitutionFetchModel>>> call(institutionGroupId) async {
    try {
      final response = jsonDecode(_mockJson);
      final List jsonList = response['body'];
      final result = jsonList.map((json) => InstitutionFetchModel.fromJson(json)).toList();
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
          "id": 0,
          "name": "Iti",
          "income_statement_accounts": [
            {
              "id": 17,
              "control_date": "2023-05-12T00:00:00Z",
              "value": 10.0,
              "type": {
                "id": 2,
                "name": "Rico Trader",
                "is_expense": true
              }
            },
            {
              "id": 15,
              "control_date": "2023-05-10T00:00:00Z",
              "value": 20.0,
              "type": {
                "id": 0,
                "name": "Amazon prime",
                "is_expense": true
              }
            },
            {
              "id": 24,
              "control_date": "2023-05-30T00:00:00Z",
              "value": 10400.0,
              "type": {
                "id": 9,
                "name": "Salário",
                "is_expense": false
              }
            },
            {
              "id": 13,
              "control_date": "2023-04-27T19:18:46.040Z",
              "value": 10.0,
              "type": {
                "id": 0,
                "name": "Amazon prime",
                "is_expense": true
              }
            },
            {
              "id": 25,
              "control_date": "2023-06-02T00:00:00Z",
              "value": 1200.036,
              "type": {
                "id": 10,
                "name": "Aluguel",
                "is_expense": true
              }
            },
            {
              "id": 26,
              "control_date": "2023-06-03T00:00:00Z",
              "value": 1200.0,
              "type": {
                "id": 11,
                "name": "Professor",
                "is_expense": true
              }
            },
            {
              "id": 14,
              "control_date": "2023-04-27T19:18:46.040Z",
              "value": 10.0,
              "type": {
                "id": 2,
                "name": "Rico Trader",
                "is_expense": true
              }
            },
            {
              "id": 22,
              "control_date": "2023-05-15T00:00:00Z",
              "value": 69.0,
              "type": {
                "id": 6,
                "name": "Spotify",
                "is_expense": true
              }
            },
            {
              "id": 18,
              "control_date": "2023-05-20T00:00:00Z",
              "value": 10.0,
              "type": {
                "id": 2,
                "name": "Rico Trader",
                "is_expense": true
              }
            },
            {
              "id": 19,
              "control_date": "2023-05-10T00:00:00Z",
              "value": 10.0,
              "type": {
                "id": 3,
                "name": "Disney",
                "is_expense": true
              }
            },
            {
              "id": 20,
              "control_date": "2023-05-15T00:00:00Z",
              "value": 7.5,
              "type": {
                "id": 4,
                "name": "HBO",
                "is_expense": true
              }
            },
            {
              "id": 16,
              "control_date": "2023-05-11T00:00:00Z",
              "value": 10.0,
              "type": {
                "id": 2,
                "name": "Rico Trader",
                "is_expense": true
              }
            },
            {
              "id": 2,
              "control_date": "2023-04-26T19:18:46.040Z",
              "value": 10.0,
              "type": {
                "id": 0,
                "name": "Amazon prime",
                "is_expense": true
              }
            },
            {
              "id": 12,
              "control_date": "2023-04-27T19:18:46.040Z",
              "value": 10.0,
              "type": {
                "id": 0,
                "name": "Amazon prime",
                "is_expense": true
              }
            },
            {
              "id": 21,
              "control_date": "2023-05-15T00:00:00Z",
              "value": 20.0,
              "type": {
                "id": 5,
                "name": "Netflix",
                "is_expense": true
              }
            },
            {
              "id": 23,
              "control_date": "2023-05-13T00:00:00Z",
              "value": 60.0,
              "type": {
                "id": 7,
                "name": "Barbearia",
                "is_expense": true
              }
            },
            {
              "id": 11,
              "control_date": "2023-04-27T19:18:46.040Z",
              "value": 20.0,
              "type": {
                "id": 0,
                "name": "Amazon prime",
                "is_expense": true
              }
            },
            {
              "id": 27,
              "control_date": "2023-06-03T00:00:00Z",
              "value": 70.1,
              "type": {
                "id": 12,
                "name": "DAS",
                "is_expense": true
              }
            }
          ]
        }
      ]
    }
  """;
}
