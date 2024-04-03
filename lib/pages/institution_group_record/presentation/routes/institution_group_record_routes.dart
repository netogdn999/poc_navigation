import 'package:finance/private/core/constants/environment.dart';
import 'package:finance/private/core/constants/strings.dart';
import 'package:finance/private/navigation/base_routes.dart';
import 'package:finance/private/navigation/navigation_route.dart';
import 'package:finance/private/src/institution_group/repository/institution_group_repository_interface.dart';
import 'package:finance/private/src/institution_group/repository/mock/mock_institution_group_create_repository.dart';
import 'package:finance/private/src/institution_group/repository/remote/remote_institution_group_create_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/institution_group_record_bloc.dart';
import '../pages/institution_group_record_page.dart';

part '../../injection/injection.dart';

class InstitutionGroupRecordRoutes implements NavigationRoute<RoutePath> {
  @override
  Page routes({required RoutePath route, dynamic params}) =>
    MaterialPage(
      key: const ValueKey(AppStrings.institutionGroupRecordTitle),
      child: _Injection(
        child: InstitutionGroupRecordPage(
          title: AppStrings.institutionGroupRecordTitle.value,
        ),
      ),
    );

  const InstitutionGroupRecordRoutes();
}
