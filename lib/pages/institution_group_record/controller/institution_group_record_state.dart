
part of 'institution_group_record_bloc.dart';

enum Status {
  initial,
  error,
  registering,
  registered,
}

class InstitutionGroupRecordState {
  final Failure? error;
  final Status status;

  const InstitutionGroupRecordState.initial()
    : error = null,
      status = Status.initial;

  const InstitutionGroupRecordState.error(this.error)
    : status = Status.error;

  const InstitutionGroupRecordState.registering()
    : error = null,
      status = Status.registering;

  const InstitutionGroupRecordState.registered()
    : error = null,
      status = Status.registered;

}