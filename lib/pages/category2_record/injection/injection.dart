part of '../presentation/routes/category2_record_routes.dart';

class _Injection extends StatelessWidget with AppEnvironment {
  final Widget child;
  const _Injection({required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: repositories,
      child: BlocProvider<Category2RecordBloc>(
        create: (context) => Category2RecordBloc(
          repositoryFetchAllCategory1: context.read<Category1FetchAllRepository>(),
          repositoryRegisterCategory2: context.read<Category2RegisterInCategory1Repository>()
        )..add(const FetchCategories1()),
        child: child,
      ),
    );
  }

  List<RepositoryProvider> get repositories {
    if(type == EnvironmentType.dev || type == EnvironmentType.mock) {
      return [
        RepositoryProvider<Category2RegisterInCategory1Repository>(
          create: (_) => MockCategory2RegisterInCategory1RepositoryImpl(),
        ),
        RepositoryProvider<Category1FetchAllRepository>(
          create: (_) => MockCategory1FetchAllRepositoryImpl(),
        ),
      ];
    }
    return [
      RepositoryProvider<Category2RegisterInCategory1Repository>(
        create: (_) => RemoteCategory2RegisterInCategory1RepositoryImpl(),
      ),
      RepositoryProvider<Category1FetchAllRepository>(
        create: (_) => RemoteCategory1FetchAllRepositoryImpl(),
      ),
    ];
  }
}
