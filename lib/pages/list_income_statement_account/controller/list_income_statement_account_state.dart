part of 'list_income_statement_account_bloc.dart';

enum Status {
  initial,
  loading,
  error,
  fetchAllData,
}

class ListIncomeStatementAccountState {
  final List<IncomeStatementAccountModel> incomeStatementAccounts;
  final Failure? error;
  final Status status;

  const ListIncomeStatementAccountState.inital()
    : incomeStatementAccounts = const [],
      error = null,
      status = Status.initial;

  const ListIncomeStatementAccountState.loading()
    : incomeStatementAccounts = const [],
      error = null,
      status = Status.loading;

  const ListIncomeStatementAccountState.error(this.error)
    : incomeStatementAccounts = const [],
      status = Status.error;

  const ListIncomeStatementAccountState.fetchAllData(this.incomeStatementAccounts)
    : error = null,
      status = Status.fetchAllData;

  Map<String, List<IncomeStatementAccountModel>> get incomeStatementAccountsGroupedByType {
    final Map<String, List<IncomeStatementAccountModel>> result = {};
    for (var item in incomeStatementAccounts) {
      if (result.containsKey(item.type.name)) {
        result[item.type.name]?.add(item);

        continue;
      }

      result[item.type.name] = [item];
    }
    return result;
  }
}