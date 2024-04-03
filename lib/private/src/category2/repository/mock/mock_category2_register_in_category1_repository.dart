import 'package:finance/private/core/entity/failure.dart';
import 'package:finance/private/core/entity/response.dart';

import '../../model/category2_record_model.dart';
import '../category2_repository_interface.dart';

class MockCategory2RegisterInCategory1RepositoryImpl implements Category2RegisterInCategory1Repository {

  @override
  Future<Response<Failure, Unit>> call(int category1Id, Category2RecordModel model) async {
    try {
      return const Response(
        body: unit
      );
    } catch (ex) {
      return Response(
        error: ResquestError(ex.toString())
      );
    }
  }
}
