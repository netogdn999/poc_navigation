import 'package:finance/private/core/constants/environment.dart';
import 'package:finance/private/core/constants/strings.dart';
import 'package:finance/private/navigation/base_routes.dart';
import 'package:finance/private/navigation/navigation_route.dart';
import 'package:finance/private/src/category1/repository/category1_repository_interface.dart';
import 'package:finance/private/src/category1/repository/mock/mock_category1_create_repository.dart';
import 'package:finance/private/src/category1/repository/remote/remote_category1_create_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/category1_record_bloc.dart';
import '../pages/category1_record_page.dart';

part '../../injection/injection.dart';

class Category1RecordRoutes implements NavigationRoute<RoutePath> {
  @override
  Page routes({required RoutePath route, dynamic params}) =>
    MaterialPage(
      key: const ValueKey(AppStrings.category1RecordTitle),
      child: _Injection(
        child: Category1RecordPage(
          title: AppStrings.category1RecordTitle.value,
        ),
      ),
    );

  const Category1RecordRoutes();
}
