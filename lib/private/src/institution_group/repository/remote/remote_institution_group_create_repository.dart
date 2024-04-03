import 'package:finance/private/core/entity/failure.dart';
import 'package:finance/private/core/entity/finance_client.dart';
import 'package:finance/private/core/entity/response.dart';

import '../../model/institution_group_record_model.dart';
import '../institution_group_repository_interface.dart';

class RemoteInstitutionGroupCreateRepositoryImpl implements InstitutionGroupCreateRepository {

  @override
  Future<Response<Failure, Unit>> call(InstitutionGroupRecordModel model) async {
    try {
      final response = await post(
        path: "/institutionGroup",
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