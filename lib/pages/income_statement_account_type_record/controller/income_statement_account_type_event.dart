
part of 'income_statement_account_type_bloc.dart';

abstract class IncomeStatementAccountTypeEvent {
  const IncomeStatementAccountTypeEvent();
}

class FetchCategories2 extends IncomeStatementAccountTypeEvent {
  final int category1Id;
  
  const FetchCategories2(this.category1Id);
}

class FetchCategories1 extends IncomeStatementAccountTypeEvent {
  const FetchCategories1();
}

class RegisterTyper extends IncomeStatementAccountTypeEvent {
  final int category2Id;
  final IncomeStatementAccountTypeRegisterModel model;

  RegisterTyper({required this.category2Id, required String name, required bool isExpense}) 
    : model = IncomeStatementAccountTypeRegisterModel(
        name: name,
        isExpense: isExpense,
      );
}