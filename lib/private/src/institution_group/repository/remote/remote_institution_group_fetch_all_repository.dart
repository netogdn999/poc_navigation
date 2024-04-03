import 'dart:convert';

import 'package:finance/private/core/entity/failure.dart';
import 'package:finance/private/core/entity/finance_client.dart';
import 'package:finance/private/core/entity/response.dart';

import '../../model/institution_group_fetch_model.dart';
import '../institution_group_repository_interface.dart';

class RemoteInstitutionGroupFetchAllRepositoryImpl implements InstitutionGroupFetchAllRepository {
  @override
  Future<Response<Failure, List<InstitutionGroupFetchModel>>> call() async {
    try {
      final response = await get(path: "/institutionGroup");
      if(response.statusCode == FinanceStatusCode.ok.code) {
        final Map<String, dynamic> responseJson = jsonDecode(response.body);
        final List jsonList = responseJson['body'];
        final result = jsonList.map((json) => InstitutionGroupFetchModel.fromJson(json)).toList();
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