import 'dart:convert';

import 'package:finance/private/core/entity/failure.dart';
import 'package:finance/private/core/entity/finance_client.dart';
import 'package:finance/private/core/entity/response.dart';

import '../../model/category1_fetch_with_average_model.dart';
import '../category1_repository_interface.dart';

class RemoteCategory1FetchAllWithAverageRepositoryImpl implements Category1FetchAllWithAverageRepository {
  @override
  Future<Response<Failure, List<Category1FetchWithAverageModel>>> call() async {
    try {
      final response = await get(path: "/category1/average");
      if(response.statusCode == FinanceStatusCode.ok.code) {
        final Map<String, dynamic> responseJson = jsonDecode(response.body);
        final List jsonList = responseJson['body'];
        final result = jsonList.map((json) => Category1FetchWithAverageModel.fromJson(json)).toList();
        return Response(body: result);
      }

      return Response(
        error: ResquestError(response.body),
      );
    } catch (ex) {
      return Response(
        error: ResquestError(ex.toString()),
      );
    }
  }
}