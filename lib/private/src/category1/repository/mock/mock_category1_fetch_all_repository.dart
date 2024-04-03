import 'dart:convert';

import 'package:finance/private/core/entity/failure.dart';
import 'package:finance/private/core/entity/response.dart';

import '../../model/category1_fetch_model.dart';
import '../category1_repository_interface.dart';

class MockCategory1FetchAllRepositoryImpl implements Category1FetchAllRepository {
  
  @override
  Future<Response<Failure, List<Category1FetchModel>>> call() async {
    try {
      final response = jsonDecode(_mockJson);
      final List jsonList = response['body'];
      final result = jsonList.map((json) => Category1FetchModel.fromJson(json)).toList();
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
          "name": "Despesas fixas",
          "categories_2": [
            {
              "id": 0,
              "name": "Plataformas",
              "income_statement_account_types": [
                {
                  "id": 0,
                  "name": "Amazon prime",
                  "is_expense": true
                },
                {
                  "id": 6,
                  "name": "Spotify",
                  "is_expense": true
                },
                {
                  "id": 2,
                  "name": "Rico Trader",
                  "is_expense": true
                },
                {
                  "id": 4,
                  "name": "HBO",
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
                }
              ]
            },
            {
              "id": 3,
              "name": "Aula de inglês",
              "income_statement_account_types": [
                {
                  "id": 11,
                  "name": "Professor",
                  "is_expense": true
                }
              ]
            },
            {
              "id": 1,
              "name": "Moradia",
              "income_statement_account_types": [
                {
                  "id": 10,
                  "name": "Aluguel",
                  "is_expense": true
                }
              ]
            },
            {
              "id": 2,
              "name": "Tarifas",
              "income_statement_account_types": [
                {
                  "id": 12,
                  "name": "DAS",
                  "is_expense": true
                }
              ]
            }
          ]
        },
        {
          "id": 1,
          "name": "Despesas variáveis",
          "categories_2": [
            {
              "id": 4,
              "name": "Beleza",
              "income_statement_account_types": [
                {
                  "id": 7,
                  "name": "Barbearia",
                  "is_expense": true
                },
                {
                  "id": 8,
                  "name": "Roupas",
                  "is_expense": true
                }
              ]
            }
          ]
        },
        {
          "id": 2,
          "name": "Receitas",
          "categories_2": [
            {
              "id": 5,
              "name": "Renda",
              "income_statement_account_types": [
                {
                  "id": 9,
                  "name": "Salário",
                  "is_expense": false
                }
              ]
            }
          ]
        }
      ]
    }
  """;
}
