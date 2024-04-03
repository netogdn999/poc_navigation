import 'dart:convert';

import 'package:finance/private/core/entity/failure.dart';
import 'package:finance/private/core/entity/finance_client.dart';
import 'package:finance/private/core/entity/response.dart';
import 'package:finance/private/src/institution/model/institution_fetch_model.dart';
import 'package:finance/private/src/institution/repository/institution_repository_interface.dart';

class RemoteInstitutionFetchAllByGroupRepositoryImpl implements InstitutionFetchAllByGroupRepository {
  @override
  Future<Response<Failure, List<InstitutionFetchModel>>> call(institutionGroupId) async {
    try {
      final response = await get(path: "/institutionGroup/$institutionGroupId/institution");
      if(response.statusCode == FinanceStatusCode.ok.code) {
        final Map<String, dynamic> responseJson = jsonDecode(response.body);
        final List jsonList = responseJson['body'];
        final result = jsonList.map((json) => InstitutionFetchModel.fromJson(json)).toList();
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
