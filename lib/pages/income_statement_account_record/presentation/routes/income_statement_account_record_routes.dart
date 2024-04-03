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
import 'package:finance/private/src/income_statement_account/repository/income_statement_account_repository_interface.dart';
import 'package:finance/private/src/income_statement_account/repository/mock/mock_statement_account_create_repository.dart';
import 'package:finance/private/src/income_statement_account/repository/remote/remote_income_statement_account_create_repository.dart';
import 'package:finance/private/src/income_statement_account_type/repository/income_statement_account_type_repository_interface.dart';
import 'package:finance/private/src/income_statement_account_type/repository/mock/mock_income_statement_account_type_fetch_all_by_category2_repository.dart';
import 'package:finance/private/src/income_statement_account_type/repository/remote/remote_income_statement_account_type_fetch_all_by_category2_repository.dart';
import 'package:finance/private/src/institution/repository/institution_repository_interface.dart';
import 'package:finance/private/src/institution/repository/mock/mock_institution_fetch_all_by_group_repository.dart';
import 'package:finance/private/src/institution/repository/remote/remote_institution_fetch_all_by_group_repository.dart';
import 'package:finance/private/src/institution_group/repository/institution_group_repository_interface.dart';
import 'package:finance/private/src/institution_group/repository/mock/mock_institution_group_fetch_all_repository.dart';
import 'package:finance/private/src/institution_group/repository/remote/remote_institution_group_fetch_all_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/income_statement_account_record_bloc.dart';
import '../pages/income_statement_account_record_page.dart';

part '../../injection/injection.dart';

class IncomeSatetamentAccountRecordRoutes implements NavigationRoute<RoutePath> {

  @override
  Page routes({required RoutePath route, dynamic params}) =>
    MaterialPage(
      key: const ValueKey(AppStrings.incomeStatementAccountRecordTitle),
      child: _Injection(
        child: IncomeStatementAccountRecordPage(
          title: AppStrings.incomeStatementAccountRecordTitle.value,
        ),
      ),
    );

  const IncomeSatetamentAccountRecordRoutes();
}
