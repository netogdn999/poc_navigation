import 'package:finance/private/core/entity/failure.dart';
import 'package:finance/private/core/entity/finance_client.dart';
import 'package:finance/private/core/entity/response.dart';
import 'package:finance/private/src/institution/repository/institution_repository_interface.dart';

import '../../model/institution_record_model.dart';

class RemoteInstitutionCreateRepositoryImpl implements InstitutionCreateRepository {

  @override
  Future<Response<Failure, Unit>> call(int institutionGroupId, InstitutionRecordModel model) async {
    try {
      final response = await post(
        path: "/institutionGroup/$institutionGroupId/registerInstitution",
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
