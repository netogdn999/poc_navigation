import 'package:finance/private/core/constants/environment.dart';
import 'package:finance/private/core/constants/strings.dart';
import 'package:finance/private/navigation/base_routes.dart';
import 'package:finance/private/navigation/navigation_route.dart';
import 'package:finance/private/src/category1/repository/category1_repository_interface.dart';
import 'package:finance/private/src/category1/repository/mock/mock_category1_fetch_all_repository.dart';
import 'package:finance/private/src/category1/repository/remote/remote_category1_fetch_all_repository.dart';
import 'package:finance/private/src/category2/repository/category2_repository_interface.dart';
import 'package:finance/private/src/category2/repository/mock/mock_category2_fetch_all_by_category1_repository.dart';
import 'package:finance/private/src/category2/repository/remote/remote_category2_fetch_all_by_category1_repository.dart';
import 'package:finance/private/src/income_statement_account_type/repository/income_statement_account_type_repository_interface.dart';
import 'package:finance/private/src/income_statement_account_type/repository/mock/mock_income_statement_account_type_create_repository.dart';
import 'package:finance/private/src/income_statement_account_type/repository/remote/remote_income_statement_account_type_create_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/income_statement_account_type_bloc.dart';
import '../pages/income_statement_account_type_record_page.dart';

part '../../injection/injection.dart';

class IncomeStatementAccountTypeRecordRoutes implements NavigationRoute<RoutePath> {

  @override
  Page routes({required RoutePath route, dynamic params}) =>
    MaterialPage(
      key: const ValueKey(AppStrings.incomeStatementAccountRecordTitle),
      child: _Injection(
        child: IncomeStatementAccountTypeRecordPage(
          title: AppStrings.incomeStatementAccountRecordTitle.value,
        ),
      ),
    );

  const IncomeStatementAccountTypeRecordRoutes();
}