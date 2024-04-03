part of '../presentation/routes/category1_record_routes.dart';

class _Injection extends StatelessWidget with AppEnvironment {
  final Widget child;
  const _Injection({required this.child});

  dynamic get repositories {
    if(type == EnvironmentType.dev || type == EnvironmentType.mock) {
      return MockCategory1CreateRepositoryImpl();
    }
    return RemoteCategory1CreateRepositoryImpl();
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<Category1CreateRepository>(
      create: (_) => repositories,
      child: BlocProvider<Category1RecordBloc>(
        create: (context) => Category1RecordBloc(
          context.read<Category1CreateRepository>()
        ),
        child: child,
      ),
    );
  }
}