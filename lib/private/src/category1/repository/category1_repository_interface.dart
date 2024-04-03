import '../../../core/entity/failure.dart';
import '../../../core/entity/response.dart';
import '../model/category1_fetch_model.dart';
import '../model/category1_fetch_with_average_model.dart';
import '../model/category1_record_model.dart';

abstract class Category1FetchAllWithAverageRepository {
  Future<Response<Failure, List<Category1FetchWithAverageModel>>> call();
}

abstract class Category1FetchAllRepository {
  Future<Response<Failure, List<Category1FetchModel>>> call();
}

abstract class Category1CreateRepository {
  Future<Response<Failure, Unit>> call(Category1RecordModel model);
}