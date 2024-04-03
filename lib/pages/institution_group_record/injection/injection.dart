part of '../presentation/routes/institution_group_record_routes.dart';

class _Injection extends StatelessWidget with AppEnvironment {
  final Widget child;
  const _Injection({required this.child});

  dynamic get repositories {
    if(type == EnvironmentType.dev || type == EnvironmentType.mock) {
      return MockInstitutionGroupCreateRepositoryImpl();
    }
    return RemoteInstitutionGroupCreateRepositoryImpl();
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<InstitutionGroupCreateRepository>(
      create: (_) => repositories,
      child: BlocProvider<InstitutionGroupRecordBloc>(
        create: (context) => InstitutionGroupRecordBloc(
          context.read<InstitutionGroupCreateRepository>()
        ),
        child: child,
      ),
    );
  }
}
