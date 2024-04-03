import 'package:finance/private/core/entity/failure.dart';
import 'package:finance/private/core/entity/response.dart';

import '../model/institution_group_fetch_model.dart';
import '../model/institution_group_record_model.dart';

abstract class InstitutionGroupCreateRepository {
  Future<Response<Failure, Unit>> call(InstitutionGroupRecordModel model);
}

abstract class InstitutionGroupFetchAllRepository {
  Future<Response<Failure, List<InstitutionGroupFetchModel>>> call();
}
