import 'dart:convert';

import 'package:finance/private/core/entity/failure.dart';
import 'package:finance/private/core/entity/finance_client.dart';
import 'package:finance/private/core/entity/response.dart';

import '../../model/category2_fetch_model.dart';
import '../category2_repository_interface.dart';

class RemoteCategory2FetchAllByCategory1RepositoryImpl implements Category2FetchAllByCategory1Repository {

  @override
  Future<Response<Failure, List<Category2FetchModel>>> call(int category1Id) async {
    try {
      final response = await get(path: "/category1/$category1Id/category2");
      if(response.statusCode == FinanceStatusCode.ok.code) {
        final Map<String, dynamic> responseJson = jsonDecode(response.body);
        final List jsonList = responseJson['body'];
        final result = jsonList.map((json) => Category2FetchModel.fromJson(json)).toList();
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
