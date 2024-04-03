import 'dart:async';

import 'package:finance/private/core/entity/failure.dart';
import 'package:finance/private/core/entity/response.dart';
import 'package:finance/private/src/category1/model/category1_fetch_model.dart';
import 'package:finance/private/src/category1/repository/category1_repository_interface.dart';
import 'package:finance/private/src/category2/model/category2_fetch_model.dart';
import 'package:finance/private/src/category2/repository/category2_repository_interface.dart';
import 'package:finance/private/src/income_statement_account/model/income_statement_account_record_model.dart';
import 'package:finance/private/src/income_statement_account/model/income_statement_account_type_record_model.dart';
import 'package:finance/private/src/income_statement_account/repository/income_statement_account_repository_interface.dart';
import 'package:finance/private/src/income_statement_account_type/model/income_statement_account_type_fetch_model.dart';
import 'package:finance/private/src/income_statement_account_type/repository/income_statement_account_type_repository_interface.dart';
import 'package:finance/private/src/institution/model/institution_fetch_model.dart';
import 'package:finance/private/src/institution/repository/institution_repository_interface.dart';
import 'package:finance/private/src/institution_group/model/institution_group_fetch_model.dart';
import 'package:finance/private/src/institution_group/repository/institution_group_repository_interface.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'income_statement_account_record_event.dart';
part 'income_statement_account_record_state.dart';

class IncomeStatementAccountRecordBloc extends Bloc<IncomeStatementAccountRecordEvent, IncomeStatementAccountRecordState> {
  final IncomeStatementAccountCreateRepository repositoryCreateIncomeStatementAccount;
  final Category1FetchAllRepository repositoryFetchAllCategory1;
  final Category2FetchAllByCategory1Repository repositoryCategory2FetchAllByCategory1;
  final IncomeStatementAccountTypeFetchAllByCategory2Repository repositoryIncomeStatementAccountTypefetchAllByCategory2;
  final InstitutionGroupFetchAllRepository repositoryFetchAllInstitutionGroup;
  final InstitutionFetchAllByGroupRepository repositoryFetchAllInstitutionByGroup;

  IncomeStatementAccountRecordBloc({
    required this.repositoryCreateIncomeStatementAccount,
    required this.repositoryFetchAllCategory1,
    required this.repositoryCategory2FetchAllByCategory1,
    required this.repositoryIncomeStatementAccountTypefetchAllByCategory2,
    required this.repositoryFetchAllInstitutionGroup,
    required this.repositoryFetchAllInstitutionByGroup,
  }) : super(const IncomeStatementAccountRecordState.inital()) {
    on<RegisterIncomeStatementAccount>(_register);
    on<LoadInitialData>(_loadInitialData);
    on<LoadTypes>(_loadTypes);
    on<FetchInstitution>(_fetchInstitution);
    on<FetchCategories2>(_fetchCategory2);
  }

  FutureOr<void> _register(RegisterIncomeStatementAccount event, Emitter<IncomeStatementAccountRecordState> emit) async {
    emit(IncomeStatementAccountRecordState.registering(state.institutionGroup, state.institutions, state.types, state.categories1, state.categories2));
    final result = await repositoryCreateIncomeStatementAccount(event.institutionId, event.model);
    result.map(
      (result) => emit(IncomeStatementAccountRecordState.success(state.institutionGroup, state.categories1)),
      (error) => emit(IncomeStatementAccountRecordState.error(error)),
    );
  }

  FutureOr<void> _loadInitialData(LoadInitialData event, Emitter<IncomeStatementAccountRecordState> emit) async {
    emit(const IncomeStatementAccountRecordState.loading());

    final results = await Future.wait(
      [
        _loadInstitutionGroup(emit),
        _loadCategory1(emit),
      ],
      eagerError: true,
    );
    emit(IncomeStatementAccountRecordState.loadedData(
      results.first as List<InstitutionGroupFetchModel>,
      state.institutions,
      state.types,
      results.last as List<Category1FetchModel>,
      state.categories2,
    ));
  }
  
  Future<List<InstitutionGroupFetchModel>> _loadInstitutionGroup(Emitter<IncomeStatementAccountRecordState> emit) async {
    final result = await repositoryFetchAllInstitutionGroup();
    return result.mapOnErrorListEmpty(
      id,
      (error) => emit(IncomeStatementAccountRecordState.error(error))
    );
  }

  Future<List<Category1FetchModel>> _loadCategory1(Emitter<IncomeStatementAccountRecordState> emit) async {
    final result = await repositoryFetchAllCategory1();
    return result.mapOnErrorListEmpty(
      id,
      (error) => emit(IncomeStatementAccountRecordState.error(error)),
    );
  }

  FutureOr<void> _loadTypes(LoadTypes event, Emitter<IncomeStatementAccountRecordState> emit) async {
    emit(IncomeStatementAccountRecordState.loadingTypes(state.institutionGroup, state.institutions, state.categories1, state.categories2));

    final result = await repositoryIncomeStatementAccountTypefetchAllByCategory2(event.category2Id);
    result.map(
      (result) => emit(IncomeStatementAccountRecordState.loadedData(state.institutionGroup, state.institutions, result, state.categories1, state.categories2)),
      (error) => emit(IncomeStatementAccountRecordState.error(error)),
    );
  }

  FutureOr<void> _fetchCategory2(FetchCategories2 event, Emitter<IncomeStatementAccountRecordState> emit) async {
    emit(IncomeStatementAccountRecordState.loadingCategories2(state.institutionGroup, state.institutions, state.categories1));

    final result = await repositoryCategory2FetchAllByCategory1(event.category1Id);
    result.map(
      (result) => emit(IncomeStatementAccountRecordState.loadedData(state.institutionGroup, state.institutions, state.types, state.categories1, result)),
      (error) => emit(IncomeStatementAccountRecordState.error(error)),
    );
  }

  FutureOr<void> _fetchInstitution(FetchInstitution event, Emitter<IncomeStatementAccountRecordState> emit) async {
    emit(IncomeStatementAccountRecordState.loadingInstitution(state.institutionGroup, state.categories1, state.categories2, state.types));

    final result = await repositoryFetchAllInstitutionByGroup(event.groupId);
    result.map(
      (result) => emit(IncomeStatementAccountRecordState.loadedData(state.institutionGroup, result, state.types, state.categories1, state.categories2)),
      (error) => emit(IncomeStatementAccountRecordState.error(error)),
    );
  }
}