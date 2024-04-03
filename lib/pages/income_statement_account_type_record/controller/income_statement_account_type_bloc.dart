import 'dart:async';

import 'package:finance/private/core/entity/failure.dart';
import 'package:finance/private/src/category1/model/category1_fetch_model.dart';
import 'package:finance/private/src/category1/repository/category1_repository_interface.dart';
import 'package:finance/private/src/category2/model/category2_fetch_model.dart';
import 'package:finance/private/src/category2/repository/category2_repository_interface.dart';
import 'package:finance/private/src/income_statement_account_type/model/income_statement_account_type_register_model.dart';
import 'package:finance/private/src/income_statement_account_type/repository/income_statement_account_type_repository_interface.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'income_statement_account_type_state.dart';
part 'income_statement_account_type_event.dart';

class IncomeStatementAccountTypeBloc extends Bloc<IncomeStatementAccountTypeEvent, IncomeStatementAccountTypeState> {
  final IncomeStatementAccountTypeCreateRepository repositoryCreateIncomeStatementAccountType;
  final Category1FetchAllRepository repositoryFetchAllCategory1;
  final Category2FetchAllByCategory1Repository repositoryCategory2FetchAllByCategory1;

  IncomeStatementAccountTypeBloc({
    required this.repositoryCreateIncomeStatementAccountType,
    required this.repositoryFetchAllCategory1,
    required this.repositoryCategory2FetchAllByCategory1,

  }) : super(const IncomeStatementAccountTypeState.initial()) {
    on<RegisterTyper>(_register);
    on<FetchCategories1>(_loadCategory1);
    on<FetchCategories2>(_loadCategory2);
  }

  FutureOr<void> _register(RegisterTyper event, Emitter<IncomeStatementAccountTypeState> emit) async {
    emit(IncomeStatementAccountTypeState.registering(state.categories1, state.categories2));
    final result = await repositoryCreateIncomeStatementAccountType(event.category2Id, event.model);
    result.map(
      (_) => emit(IncomeStatementAccountTypeState.registered(state.categories1, state.categories2)),
      (error) => emit(IncomeStatementAccountTypeState.error(error)),
    );
  }

  FutureOr<void> _loadCategory1(FetchCategories1 event, Emitter<IncomeStatementAccountTypeState> emit) async {
    emit(const IncomeStatementAccountTypeState.loading());
    final result = await repositoryFetchAllCategory1();
    result.map(
      (result) => emit(IncomeStatementAccountTypeState.loadedCategories(result, state.categories2)),
      (error) => emit(IncomeStatementAccountTypeState.error(error)),
    );
  }

  FutureOr<void> _loadCategory2(FetchCategories2 event, Emitter<IncomeStatementAccountTypeState> emit) async {
    emit(IncomeStatementAccountTypeState.loadingCategories2(state.categories1));
    final result = await repositoryCategory2FetchAllByCategory1(event.category1Id);
    result.map(
      (result) => emit(IncomeStatementAccountTypeState.loadedCategories(state.categories1, result)),
      (error) => emit(IncomeStatementAccountTypeState.error(error)),
    );
  }
}