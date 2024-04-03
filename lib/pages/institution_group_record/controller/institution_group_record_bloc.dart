import 'dart:async';

import 'package:finance/private/core/entity/failure.dart';
import 'package:finance/private/src/institution_group/model/institution_group_record_model.dart';
import 'package:finance/private/src/institution_group/repository/institution_group_repository_interface.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'institution_group_record_state.dart';
part 'institution_group_record_event.dart';

class InstitutionGroupRecordBloc extends Bloc<InstitutionGroupRecordEvent, InstitutionGroupRecordState> {
  final InstitutionGroupCreateRepository repositoryCreateInstitutionGroup;

  InstitutionGroupRecordBloc(this.repositoryCreateInstitutionGroup) : super(const InstitutionGroupRecordState.initial()) {
    on<RegisterInstitutionGroup>(_register);
  }

  FutureOr<void> _register(RegisterInstitutionGroup event, Emitter<InstitutionGroupRecordState> emit) async {
    emit(const InstitutionGroupRecordState.registering());
    final result = await repositoryCreateInstitutionGroup(event.institutionGroup);
    result.map(
      (result) => emit(const InstitutionGroupRecordState.registered()),
      (error) => emit(InstitutionGroupRecordState.error(error)),
    );
  }
}