
part of 'institution_record_bloc.dart';

abstract class InstitutionRecordEvent {
  const InstitutionRecordEvent();
}

class RegisterInstitution extends InstitutionRecordEvent {
  final int institutionGroupId;
  final InstitutionRecordModel model;

  RegisterInstitution({required this.institutionGroupId, required String name})
    : model = InstitutionRecordModel(
      name: name
    );
}

class FetchInstitutionGroup extends InstitutionRecordEvent {
  const FetchInstitutionGroup();
}