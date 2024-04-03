import 'package:finance/private/core/constants/environment.dart';
import 'package:finance/private/core/constants/strings.dart';
import 'package:finance/private/navigation/base_routes.dart';
import 'package:finance/private/navigation/navigation_route.dart';
import 'package:finance/private/src/institution/repository/mock/mock_institution_repository_create_interface.dart';
import 'package:finance/private/src/institution_group/repository/institution_group_repository_interface.dart';
import 'package:finance/private/src/institution_group/repository/mock/mock_institution_group_fetch_all_repository.dart';
import 'package:finance/private/src/institution_group/repository/remote/remote_institution_group_fetch_all_repository.dart';
import 'package:finance/private/src/institution/repository/institution_repository_interface.dart';
import 'package:finance/private/src/institution/repository/remote/remote_institution_create_repository_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/institution_record_bloc.dart';
import '../pages/institution_record_page.dart';

part '../../injection/injection.dart';

class InstitutionRecordRoutes implements NavigationRoute<RoutePath> {
  @override
  Page routes({required RoutePath route, dynamic params}) =>
    MaterialPage(
      key: const ValueKey(AppStrings.institutionRecordTitle),
      child: _Injection(
        child: InstitutionRecordPage(
          title: AppStrings.institutionRecordTitle.value,
        ),
      ),
    );

  const InstitutionRecordRoutes();
}
