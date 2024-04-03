
import 'dart:async';

import 'package:finance/private/core/entity/failure.dart';
import 'package:finance/private/core/entity/response.dart';
import 'package:finance/private/src/income_statement_account/model/income_statement_account_model.dart';
import 'package:finance/private/src/income_statement_account/repository/income_statement_account_repository_interface.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'list_income_statement_account_state.dart';
part 'list_income_statement_account_event.dart';

class ListIncomeStatementAccountBloc extends Bloc<ListIncomeStatementAccountEvent, ListIncomeStatementAccountState> {
  final IncomeStatementAccountFetchAllExpensesRepository repositoryFetchAllExpensesIncomeStatementAccount;
  final IncomeStatementAccountFetchAllIncomesRepository repositoryFetchAllIncomesIncomeStatementAccount;

  ListIncomeStatementAccountBloc({
    required this.repositoryFetchAllExpensesIncomeStatementAccount,
    required this.repositoryFetchAllIncomesIncomeStatementAccount,
  }) : super(const ListIncomeStatementAccountState.inital()) {
    on<FetchAllIncomeStatementAccount>(_fetchList);
  }

  FutureOr<void> _fetchList(FetchAllIncomeStatementAccount event,  Emitter<ListIncomeStatementAccountState> emit) async {
    emit(const ListIncomeStatementAccountState.loading());
    late final Response result;
    
    if (event.isExpense) {
      result = await repositoryFetchAllExpensesIncomeStatementAccount();
    } else {
      result = await repositoryFetchAllIncomesIncomeStatementAccount();
    }
    result.map(
      (result) => emit(ListIncomeStatementAccountState.fetchAllData(result)),
      (error) => emit(ListIncomeStatementAccountState.error(error)),
    );
  }
}