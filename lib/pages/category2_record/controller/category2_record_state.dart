
part of 'category2_record_bloc.dart';

enum Status {
  initial,
  loading,
  error,
  registering,
  registered,
  loaded,
}

class Category2RecordState {
  final Failure? error;
  final Status status;
  final List<Category1FetchModel> categories1;

  const Category2RecordState.initial()
    : error = null,
      categories1 = const [],
      status = Status.initial;

  const Category2RecordState.loading()
    : error = null,
      categories1 = const [],
      status = Status.loading;

  const Category2RecordState.error(this.error)
    : status = Status.error,
      categories1 = const [];

  const Category2RecordState.registering(this.categories1)
    : error = null,
      status = Status.registering;

  const Category2RecordState.registered(this.categories1)
    : error = null,
      status = Status.registered;

  const Category2RecordState.loaded(this.categories1)
    : error = null,
      status = Status.loaded;

}