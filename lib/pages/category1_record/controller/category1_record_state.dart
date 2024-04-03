
part of 'category1_record_bloc.dart';

enum Status {
  initial,
  error,
  registering,
  registered,
}

class Category1RecordState {
  final Failure? error;
  final Status status;

  const Category1RecordState.initial()
    : error = null,
      status = Status.initial;

  const Category1RecordState.error(this.error)
    : status = Status.error;

  const Category1RecordState.registering()
    : error = null,
      status = Status.registering;

  const Category1RecordState.registered()
    : error = null,
      status = Status.registered;

}