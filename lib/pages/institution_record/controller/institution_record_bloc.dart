import 'dart:async';

import 'package:finance/private/core/entity/failure.dart';
import 'package:finance/private/src/institution_group/model/institution_group_fetch_model.dart';
import 'package:finance/private/src/institution_group/repository/institution_group_repository_interface.dart';
import 'package:finance/private/src/institution/model/institution_record_model.dart';
import 'package:finance/private/src/institution/repository/institution_repository_interface.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'institution_record_state.dart';
part 'institution_record_event.dart';

class InstitutionRecordBloc extends Bloc<InstitutionRecordEvent, InstitutionRecordState> {
  final InstitutionCreateRepository repositoryCreateInstitution;
  final InstitutionGroupFetchAllRepository repositoryFetchAllInstitutionGroup;

  InstitutionRecordBloc({
    required this.repositoryCreateInstitution,
    required this.repositoryFetchAllInstitutionGroup,
  }) : super(const InstitutionRecordState.initial()) {
    on<RegisterInstitution>(_register);
    on<FetchInstitutionGroup>(_fetchCategories1);
  }

  FutureOr<void> _register(RegisterInstitution event, Emitter<InstitutionRecordState> emit) async {
    emit(InstitutionRecordState.registering(state.groups));
    final result = await repositoryCreateInstitution(event.institutionGroupId, event.model);
    result.map(
      (result) => emit(InstitutionRecordState.registered(state.groups)),
      (error) => emit(InstitutionRecordState.error(error)),
    );
  }

  FutureOr<void> _fetchCategories1 (FetchInstitutionGroup event, Emitter<InstitutionRecordState> emit) async {
    emit(const InstitutionRecordState.loading());
    final result = await repositoryFetchAllInstitutionGroup();
    result.map(
      (result) => emit(InstitutionRecordState.loaded(result)),
      (error) => emit(InstitutionRecordState.error(error)),
    );
  }
}