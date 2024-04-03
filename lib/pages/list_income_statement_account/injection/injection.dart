part of '../presentation/routes/list_income_statement_account_routes.dart';

class _Injection extends StatelessWidget with AppEnvironment {
  final Widget child;
  final Map<String, dynamic> params;
  const _Injection({required this.child, required this.params});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: repositories,
      child: BlocProvider<ListIncomeStatementAccountBloc>(
        create: (context) => ListIncomeStatementAccountBloc(
          repositoryFetchAllExpensesIncomeStatementAccount: context.read<IncomeStatementAccountFetchAllExpensesRepository>(),
          repositoryFetchAllIncomesIncomeStatementAccount: context.read<IncomeStatementAccountFetchAllIncomesRepository>(),
        )..add(FetchAllIncomeStatementAccount(isExpense: params['isExpense'])),
        child: child,
      ),
    );
  }

  List<RepositoryProvider> get repositories {
    if(type == EnvironmentType.dev || type == EnvironmentType.mock) {
      return [
        RepositoryProvider<IncomeStatementAccountFetchAllExpensesRepository>(
          create: (_) => MockIncomeStatementAccountFetchAllExpensesRepositoryImpl(),
        ),
        RepositoryProvider<IncomeStatementAccountFetchAllIncomesRepository>(
          create: (_) => MockIncomeStatementAccountFetchAllIncomesRepositoryImpl(),
        ),
      ];
    }
    return [
      RepositoryProvider<IncomeStatementAccountFetchAllExpensesRepository>(
        create: (_) => RemoteIncomeStatementAccountFetchAllExpensesRepositoryImpl(),
      ),
      RepositoryProvider<IncomeStatementAccountFetchAllIncomesRepository>(
        create: (_) => RemoteIncomeStatementAccountFetchAllIncomesRepositoryImpl(),
      ),
    ];
  }
}
