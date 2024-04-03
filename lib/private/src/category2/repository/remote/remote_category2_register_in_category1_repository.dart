import 'package:finance/private/core/entity/failure.dart';
import 'package:finance/private/core/entity/finance_client.dart';
import 'package:finance/private/core/entity/response.dart';

import '../../model/category2_record_model.dart';
import '../category2_repository_interface.dart';

class RemoteCategory2RegisterInCategory1RepositoryImpl implements Category2RegisterInCategory1Repository {

  @override
  Future<Response<Failure, Unit>> call(int category1Id, Category2RecordModel model) async {
    try {
      final response = await post(
        path: "/category1/$category1Id/category2",
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
