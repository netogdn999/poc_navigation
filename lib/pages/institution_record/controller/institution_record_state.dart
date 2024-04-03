
part of 'institution_record_bloc.dart';

enum Status {
  initial,
  loading,
  error,
  registering,
  registered,
  loaded,
}

class InstitutionRecordState {
  final Failure? error;
  final Status status;
  final List<InstitutionGroupFetchModel> groups;

  const InstitutionRecordState.initial()
    : error = null,
      groups = const [],
      status = Status.initial;

  const InstitutionRecordState.loading()
    : error = null,
      groups = const [],
      status = Status.loading;

  const InstitutionRecordState.error(this.error)
    : status = Status.error,
      groups = const [];

  const InstitutionRecordState.registering(this.groups)
    : error = null,
      status = Status.registering;

  const InstitutionRecordState.registered(this.groups)
    : error = null,
      status = Status.registered;

  const InstitutionRecordState.loaded(this.groups)
    : error = null,
      status = Status.loaded;

}