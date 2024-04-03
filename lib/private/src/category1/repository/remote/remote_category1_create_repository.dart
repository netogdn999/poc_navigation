
import 'package:finance/private/core/entity/failure.dart';
import 'package:finance/private/core/entity/finance_client.dart';
import 'package:finance/private/core/entity/response.dart';

import '../../model/category1_record_model.dart';
import '../category1_repository_interface.dart';

class RemoteCategory1CreateRepositoryImpl implements Category1CreateRepository {
  @override
  Future<Response<Failure, Unit>> call(Category1RecordModel model) async {
    try {
      final response = await post(
        path: "/category1",
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