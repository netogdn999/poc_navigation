import 'package:finance/private/core/entity/failure.dart';
import 'package:finance/private/core/entity/response.dart';

import '../../model/category1_record_model.dart';
import '../category1_repository_interface.dart';

class MockCategory1CreateRepositoryImpl implements Category1CreateRepository {

  @override
  Future<Response<Failure, Unit>> call(Category1RecordModel model) async {
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