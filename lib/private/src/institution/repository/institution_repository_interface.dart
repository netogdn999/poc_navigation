import 'package:finance/private/core/entity/failure.dart';
import 'package:finance/private/core/entity/response.dart';

import '../model/institution_fetch_model.dart';
import '../model/institution_record_model.dart';

abstract class InstitutionCreateRepository {
  Future<Response<Failure, Unit>> call(int institutionGroupId, InstitutionRecordModel model); 
}

abstract class InstitutionFetchAllByGroupRepository {
  Future<Response<Failure, List<InstitutionFetchModel>>> call(int institutionGroupId); 
}