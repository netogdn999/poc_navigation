import 'dart:convert';

import 'package:finance/private/core/entity/failure.dart';
import 'package:finance/private/core/entity/response.dart';

import '../../model/category1_fetch_with_average_model.dart';
import '../category1_repository_interface.dart';

class MockCategory1FetchAllWithAverageRepositoryImpl implements Category1FetchAllWithAverageRepository {
  
  @override
  Future<Response<Failure, List<Category1FetchWithAverageModel>>> call() async {
    try {
      final response = jsonDecode(_mockJson);
      final List jsonList = response['body'];
      final result = jsonList.map((json) => Category1FetchWithAverageModel.fromJson(json)).toList();
      return Response(body: result);
    } catch (ex) {
      return Response(
        error: ResquestError(ex.toString()),
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
          "category2": [
            {
              "id": 0,
              "name": "Plataformas",
              "average": 216.5
            },
            {
              "id": 1,
              "name": "Moradia",
              "average": 1200.036
            },
            {
              "id": 2,
              "name": "Tarifas",
              "average": 70.1
            },
            {
              "id": 3,
              "name": "Aula de inglês",
              "average": 1200.0
            }
          ]
        },
        {
          "id": 2,
          "name": "Receitas",
          "category2": [
            {
              "id": 5,
              "name": "Renda",
              "average": 10400.0
            }
          ]
        },
        {
          "id": 1,
          "name": "Despesas variáveis",
          "category2": [
            {
              "id": 4,
              "name": "Beleza",
              "average": 60.0
            }
          ]
        }
      ]
    }
  """;
}
