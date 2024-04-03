import 'package:finance/private/core/entity/failure.dart';
import 'package:finance/private/core/entity/response.dart';
import 'package:finance/private/src/institution/model/institution_record_model.dart';
import 'package:finance/private/src/institution/repository/institution_repository_interface.dart';

class MockInstitutionCreateRepositoryImpl implements InstitutionCreateRepository {

  @override
  Future<Response<Failure, Unit>> call(int institutionGroupId, InstitutionRecordModel model) async {
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
