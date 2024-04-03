import 'package:finance/private/core/constants/environment.dart';
import 'package:finance/private/core/constants/strings.dart';
import 'package:finance/private/navigation/base_routes.dart';
import 'package:finance/private/navigation/navigation_route.dart';
import 'package:finance/private/src/category1/repository/category1_repository_interface.dart';
import 'package:finance/private/src/category1/repository/mock/mock_category1_fetch_all_repository.dart';
import 'package:finance/private/src/category1/repository/remote/remote_category1_fetch_all_repository.dart';
import 'package:finance/private/src/category2/repository/category2_repository_interface.dart';
import 'package:finance/private/src/category2/repository/mock/mock_category2_register_in_category1_repository.dart';
import 'package:finance/private/src/category2/repository/remote/remote_category2_register_in_category1_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/category2_record_bloc.dart';
import '../pages/category2_record_page.dart';

part '../../injection/injection.dart';

class Category2RecordRoutes implements NavigationRoute<RoutePath> {
  @override
  Page routes({required RoutePath route, dynamic params}) =>
    MaterialPage(
      key: const ValueKey(AppStrings.category2RecordTitle),
      child: _Injection(
        child: Category2RecordPage(
          title: AppStrings.category2RecordTitle.value,
        ),
      ),
    );

  const Category2RecordRoutes();
}
