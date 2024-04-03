import 'package:finance/private/navigation/navigation_route.dart';
import 'package:finance/pages/category1_fetch/presentantion/routes/category1_routes.dart';
import 'package:finance/pages/category1_record/presentation/routes/category1_record_routes.dart';
import 'package:finance/pages/category2_record/presentation/routes/category2_record_routes.dart';
import 'package:finance/pages/home/routes/home_routes.dart';
import 'package:finance/pages/income_statement_account_record/presentation/routes/income_statement_account_record_routes.dart';
import 'package:finance/pages/income_statement_account_type_record/presentation/routes/income_statement_account_type_record_routes.dart';
import 'package:finance/pages/institution_group_record/presentation/routes/institution_group_record_routes.dart';
import 'package:finance/pages/institution_record/presentation/routes/institution_record_routes.dart';
import 'package:finance/pages/list_income_statement_account/presentation/routes/list_income_statement_account_routes.dart';

abstract class RoutePath {}

enum BaseRoutes implements RoutePath {
  home,
  expenseRecord,
  listIncomeStatementAccount,
  typeRecord,
  category2Record,
  category1Record,
  category1Details,
  institutionRecord,
  institutionGroupRecord;
}

enum SubRoutes implements RoutePath {
  incomeStatementAccountDetails;
}

Map<BaseRoutes, NavigationRoute> defaultBuilderPages() => const {
  BaseRoutes.home: HomeRoutes(),
  BaseRoutes.expenseRecord: IncomeSatetamentAccountRecordRoutes(),
  BaseRoutes.listIncomeStatementAccount: ListIncomeStatementAccountRoutes(),
  BaseRoutes.typeRecord: IncomeStatementAccountTypeRecordRoutes(),
  BaseRoutes.category2Record: Category2RecordRoutes(),
  BaseRoutes.category1Record: Category1RecordRoutes(),
  BaseRoutes.institutionRecord: InstitutionRecordRoutes(),
  BaseRoutes.institutionGroupRecord: InstitutionGroupRecordRoutes(),
  BaseRoutes.category1Details: Category1Routes(),
};