part of '../presentation/routes/income_statement_account_type_record_routes.dart';

class _Injection extends StatelessWidget with AppEnvironment {
  final Widget child;
  const _Injection({required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: repositories,
      child: BlocProvider<IncomeStatementAccountTypeBloc>(
        create: (context) => IncomeStatementAccountTypeBloc(
          repositoryCreateIncomeStatementAccountType: context.read<IncomeStatementAccountTypeCreateRepository>(),
          repositoryFetchAllCategory1: context.read<Category1FetchAllRepository>(),
          repositoryCategory2FetchAllByCategory1: context.read<Category2FetchAllByCategory1Repository>(),
        )..add(const FetchCategories1()),
        child: child,
      ),
    );
  }

  List<RepositoryProvider> get repositories {
    if(type == EnvironmentType.dev || type == EnvironmentType.mock) {
      return [
        RepositoryProvider<IncomeStatementAccountTypeCreateRepository>(
          create: (_) => MockIncomeStatementAccountTypeCreateRepositoryImpl(),
        ),
        RepositoryProvider<Category1FetchAllRepository>(
          create: (_) => MockCategory1FetchAllRepositoryImpl(),
        ),
        RepositoryProvider<Category2FetchAllByCategory1Repository>(
          create: (_) => MockCategory2FetchAllByCategory1RepositoryImpl(),
        ),
      ];
    }
    return [
      RepositoryProvider<IncomeStatementAccountTypeCreateRepository>(
        create: (_) => RemoteIncomeStatementAccountTypeCreateRepositoryImpl(),
      ),
      RepositoryProvider<Category1FetchAllRepository>(
        create: (_) => RemoteCategory1FetchAllRepositoryImpl(),
      ),
      RepositoryProvider<Category2FetchAllByCategory1Repository>(
        create: (_) => RemoteCategory2FetchAllByCategory1RepositoryImpl(),
      ),
    ];
  }
}
