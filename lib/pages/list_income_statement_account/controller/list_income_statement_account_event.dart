part of 'list_income_statement_account_bloc.dart';

abstract class ListIncomeStatementAccountEvent {
  const ListIncomeStatementAccountEvent();
}

class FetchAllIncomeStatementAccount extends ListIncomeStatementAccountEvent {
  final bool isExpense;

  const FetchAllIncomeStatementAccount({required this.isExpense});
}