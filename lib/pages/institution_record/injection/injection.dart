part of '../presentation/routes/institution_record_routes.dart';

class _Injection extends StatelessWidget with AppEnvironment {
  final Widget child;
  const _Injection({required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: repositories,
      child: BlocProvider<InstitutionRecordBloc>(
        create: (context) => InstitutionRecordBloc(
          repositoryCreateInstitution: context.read<InstitutionCreateRepository>(),
          repositoryFetchAllInstitutionGroup: context.read<InstitutionGroupFetchAllRepository>(),
        )..add(const FetchInstitutionGroup()),
        child: child,
      ),
    );
  }

  List<RepositoryProvider> get repositories {
    if(type == EnvironmentType.dev || type == EnvironmentType.mock) {
      return [
        RepositoryProvider<InstitutionCreateRepository>(
          create: (_) => MockInstitutionCreateRepositoryImpl(),
        ),
        RepositoryProvider<InstitutionGroupFetchAllRepository>(
          create: (_) => MockInstitutionGroupFetchAllRepositoryImpl(),
        ),
      ];
    }
    return [
      RepositoryProvider<InstitutionCreateRepository>(
        create: (_) => RemoteInstitutionCreateRepositoryImpl(),
      ),
      RepositoryProvider<InstitutionGroupFetchAllRepository>(
        create: (_) => RemoteInstitutionGroupFetchAllRepositoryImpl(),
      ),
    ];
  }
}
