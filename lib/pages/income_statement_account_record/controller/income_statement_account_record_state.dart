
part of 'income_statement_account_record_bloc.dart';

enum Status {
  initial,
  loading,
  loadingCategories2,
  loadingInstitution,
  loadingTypes,
  error,
  success,
  registering,
  loadedData,
}

class IncomeStatementAccountRecordState {
  final List<InstitutionGroupFetchModel> institutionGroup;
  final List<InstitutionFetchModel> institutions;
  final List<Category1FetchModel> categories1;
  final List<Category2FetchModel> categories2;
  final List<IncomeStatementAccountTypeFetchModel> types;
  final Failure? error;
  final Status status;

  const IncomeStatementAccountRecordState.inital()
    : institutions = const [],
      types = const [],
      categories1 = const [],
      categories2 = const [],
      institutionGroup = const [],
      error = null,
      status = Status.initial;

  const IncomeStatementAccountRecordState.loading()
    : institutions = const [],
      types = const [],
      categories1 = const [],
      categories2 = const [],
      institutionGroup = const [],
      error = null,
      status = Status.loading;

  const IncomeStatementAccountRecordState.error(this.error)
    : institutions = const [],
      types = const [],
      categories1 = const [],
      categories2 = const [],
      institutionGroup = const [],
      status = Status.error;

  const IncomeStatementAccountRecordState.registering(this.institutionGroup, this.institutions, this.types, this.categories1, this.categories2)
    : error = null,
      status = Status.registering;

  const IncomeStatementAccountRecordState.success(this.institutionGroup, this.categories1)
    : error = null,
      institutions = const [],
      types = const [],
      categories2 = const [],
      status = Status.success;

  const IncomeStatementAccountRecordState.loadingCategories2(this.institutionGroup, this.institutions, this.categories1)
    : error = null,
      types = const [],
      categories2 = const [],
      status = Status.loadingCategories2;

  const IncomeStatementAccountRecordState.loadingInstitution(this.institutionGroup, this.categories1, this.categories2, this.types)
    : error = null,
      institutions = const [],
      status = Status.loadingInstitution;

  const IncomeStatementAccountRecordState.loadingTypes(this.institutionGroup, this.institutions, this.categories1, this.categories2)
    : error = null,
      types = const [],
      status = Status.loadingTypes;

  const IncomeStatementAccountRecordState.loadedData(this.institutionGroup, this.institutions, this.types, this.categories1, this.categories2)
    : error = null,
      status = Status.loadedData;
}