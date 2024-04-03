import 'package:finance/private/core/constants/environment.dart';
import 'package:finance/private/core/constants/strings.dart';
import 'package:finance/private/navigation/base_routes.dart';
import 'package:finance/private/navigation/navigation_route.dart';
import 'package:finance/pages/list_income_statement_account/controller/list_income_statement_account_bloc.dart';
import 'package:finance/pages/list_income_statement_account/presentation/pages/income_statement_account_gender.dart';
import 'package:finance/private/src/income_statement_account/repository/income_statement_account_repository_interface.dart';
import 'package:finance/private/src/income_statement_account/repository/mock/mock_income_statement_account_fetch_all_expenses_repository.dart';
import 'package:finance/private/src/income_statement_account/repository/mock/mock_income_statement_account_fetch_all_incomes_repository.dart';
import 'package:finance/private/src/income_statement_account/repository/remote/remote_income_statement_account_fetch_all_expenses_repository.dart';
import 'package:finance/private/src/income_statement_account/repository/remote/remote_income_statement_account_fetch_all_incomes_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages/list_income_statement_account_page.dart';

part '../../injection/injection.dart';

class ListIncomeStatementAccountRoutes implements NavigationRoute<RoutePath> {
  @override
  Page routes({required RoutePath route, dynamic params}) => switch(route) {
    BaseRoutes.listIncomeStatementAccount => 
      MaterialPage(
        key: ValueKey(AppStrings.incomeStatementAccountGendersTitle.value),
        child: IncomeStatementAccountGender(
          title: AppStrings.incomeStatementAccountGendersTitle.value,
        ),
      ),
    SubRoutes.incomeStatementAccountDetails =>
      MaterialPage(
        key: ValueKey(AppStrings.listIncomeStatementAccountTitle.value),
        child: _Injection(
          params: params,
          child: ListIncomeStatementAccountPage(
            title: AppStrings.listIncomeStatementAccountTitle.value,
          ),
        ),
      ),
    _ => EmptyRoute()
  };

  const ListIncomeStatementAccountRoutes();
}