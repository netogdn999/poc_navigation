part of '../presentantion/routes/category1_routes.dart';

class _Injection extends StatelessWidget with AppEnvironment {
  final Widget child;
  const _Injection({required this.child});

  dynamic get repositories {
    if(type == EnvironmentType.dev || type == EnvironmentType.mock) {
      return MockCategory1FetchAllWithAverageRepositoryImpl();
    }
    return RemoteCategory1FetchAllWithAverageRepositoryImpl();
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<Category1FetchAllWithAverageRepository>(
      create: (_) => repositories,
      child: BlocProvider<Category1FetchBloc>(
        create: (context) => Category1FetchBloc(
          repositoryFetchAllCategory1WithAverage: context.read<Category1FetchAllWithAverageRepository>()
        ),
        child: child,
      ),
    );
  }
}