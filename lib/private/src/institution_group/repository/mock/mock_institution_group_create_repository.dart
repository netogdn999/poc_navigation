import 'package:finance/private/core/entity/failure.dart';
import 'package:finance/private/core/entity/response.dart';

import '../../model/institution_group_record_model.dart';
import '../institution_group_repository_interface.dart';

class MockInstitutionGroupCreateRepositoryImpl implements InstitutionGroupCreateRepository {

  @override
  Future<Response<Failure, Unit>> call(InstitutionGroupRecordModel model) async {
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