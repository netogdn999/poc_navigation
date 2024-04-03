
part of 'income_statement_account_type_bloc.dart';

enum Status {
  initial,
  loading,
  loadingCategories2,
  error,
  loaddedCategories,
  registering,
  registered,
}

class IncomeStatementAccountTypeState {
  final List<Category1FetchModel> categories1;
  final List<Category2FetchModel> categories2;
  final Failure? error;
  final Status status;

  const IncomeStatementAccountTypeState.initial()
    : categories1 = const [],
      categories2 = const [],
      error = null,
      status = Status.initial;

  const IncomeStatementAccountTypeState.loading()
    : categories1 = const [],
      categories2 = const [],
      error = null,
      status = Status.loading;

  const IncomeStatementAccountTypeState.error(Failure failure)
    : categories1 = const [],
      categories2 = const [],
      error = failure,
      status = Status.error;

  const IncomeStatementAccountTypeState.loadingCategories2(this.categories1)
    : error = null,
      categories2 = const [],
      status = Status.loadingCategories2;

  const IncomeStatementAccountTypeState.loadedCategories(this.categories1, this.categories2)
    : error = null,
      status = Status.loaddedCategories;

  const IncomeStatementAccountTypeState.registering(this.categories1, this.categories2)
    : error = null,
      status = Status.registering;

  const IncomeStatementAccountTypeState.registered(this.categories1, this.categories2)
    : error = null,
      status = Status.registered;
}