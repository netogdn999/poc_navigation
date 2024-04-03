
part of 'income_statement_account_record_bloc.dart';

class IncomeStatementAccountRecordEvent {
  const IncomeStatementAccountRecordEvent();
}

class RegisterIncomeStatementAccount extends IncomeStatementAccountRecordEvent {
  final int institutionId;
  final IncomeStatementAccountRecordModel model;

  RegisterIncomeStatementAccount({
    required this.institutionId,
    required DateTime controlDate,
    required double value,
    required int typeId,
  }) : model = IncomeStatementAccountRecordModel(
        controlDate: controlDate,
        value: value,
        type: IncomeStatementAccountTypeRecordModel(
          id: typeId,
        ),
      );
}

class LoadInitialData extends IncomeStatementAccountRecordEvent {
  const LoadInitialData();
}

class LoadTypes extends IncomeStatementAccountRecordEvent {
  final int category2Id;

  const LoadTypes(this.category2Id);
}

class FetchInstitution extends IncomeStatementAccountRecordEvent {
  final int groupId;

  const FetchInstitution(this.groupId);
}

class FetchCategories2 extends IncomeStatementAccountRecordEvent {
  final int category1Id;

  const FetchCategories2(this.category1Id);
}