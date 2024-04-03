import 'package:finance/private/core/entity/failure.dart';
import 'package:finance/private/core/entity/response.dart';

import '../model/category2_fetch_model.dart';
import '../model/category2_record_model.dart';

abstract class Category2RegisterInCategory1Repository {
  Future<Response<Failure, Unit>> call(int category1Id, Category2RecordModel model); 
}

abstract class Category2FetchAllByCategory1Repository {
  Future<Response<Failure, List<Category2FetchModel>>> call(int category1Id); 
}