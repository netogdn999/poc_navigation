
part of 'institution_group_record_bloc.dart';

abstract class InstitutionGroupRecordEvent {
  const InstitutionGroupRecordEvent();
}

class RegisterInstitutionGroup extends InstitutionGroupRecordEvent {
  final InstitutionGroupRecordModel institutionGroup;

  RegisterInstitutionGroup({required String name})
    : institutionGroup = InstitutionGroupRecordModel(
      name: name,
    );
}