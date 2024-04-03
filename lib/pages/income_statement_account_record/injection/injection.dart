part of '../presentation/routes/income_statement_account_record_routes.dart';

class _Injection extends StatelessWidget with AppEnvironment {
  final Widget child;
  const _Injection({required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: repositories,
      child: BlocProvider<IncomeStatementAccountRecordBloc>(
        create: (context) => IncomeStatementAccountRecordBloc(
          repositoryCreateIncomeStatementAccount: context.read<IncomeStatementAccountCreateRepository>(),
          repositoryFetchAllCategory1: context.read<Category1FetchAllRepository>(),
          repositoryCategory2FetchAllByCategory1: context.read<Category2FetchAllByCategory1Repository>(),
          repositoryIncomeStatementAccountTypefetchAllByCategory2: context.read<IncomeStatementAccountTypeFetchAllByCategory2Repository>(),
          repositoryFetchAllInstitutionByGroup: context.read<InstitutionFetchAllByGroupRepository>(),
          repositoryFetchAllInstitutionGroup: context.read<InstitutionGroupFetchAllRepository>(),
        )..add(const LoadInitialData()),
        child: child,
      ),
    );
  }

  List<RepositoryProvider> get repositories {
    if(type == EnvironmentType.dev || type == EnvironmentType.mock) {
      return [
        RepositoryProvider<IncomeStatementAccountCreateRepository>(
          create: (_) => MockIncomeStementAccountCreateRepositoryImpl(),
        ),
        RepositoryProvider<Category1FetchAllRepository>(
          create: (_) => MockCategory1FetchAllRepositoryImpl(),
        ),
        RepositoryProvider<Category2FetchAllByCategory1Repository>(
          create: (_) => MockCategory2FetchAllByCategory1RepositoryImpl(),
        ),
        RepositoryProvider<IncomeStatementAccountTypeFetchAllByCategory2Repository>(
          create: (_) => MockIncomeStatementAccountTypeFetchAllByCategory2RepositoryImpl(),
        ),
        RepositoryProvider<InstitutionFetchAllByGroupRepository>(
          create: (_) => MockInstitutionFetchAllByGroupRepositoryImpl(),
        ),
        RepositoryProvider<InstitutionGroupFetchAllRepository>(
          create: (_) => MockInstitutionGroupFetchAllRepositoryImpl(),
        ),
      ];
    }
    return [
      RepositoryProvider<IncomeStatementAccountCreateRepository>(
        create: (_) => RemoteIncomeStementAccountCreateRepositoryImpl(),
      ),
      RepositoryProvider<Category1FetchAllRepository>(
        create: (_) => RemoteCategory1FetchAllRepositoryImpl(),
      ),
      RepositoryProvider<Category2FetchAllByCategory1Repository>(
        create: (_) => RemoteCategory2FetchAllByCategory1RepositoryImpl(),
      ),
      RepositoryProvider<IncomeStatementAccountTypeFetchAllByCategory2Repository>(
        create: (_) => RemoteIncomeStatementAccountTypeFetchAllByCategory2RepositoryImpl(),
      ),
      RepositoryProvider<InstitutionFetchAllByGroupRepository>(
        create: (_) => RemoteInstitutionFetchAllByGroupRepositoryImpl(),
      ),
      RepositoryProvider<InstitutionGroupFetchAllRepository>(
        create: (_) => RemoteInstitutionGroupFetchAllRepositoryImpl(),
      ),
    ];
  }
}
