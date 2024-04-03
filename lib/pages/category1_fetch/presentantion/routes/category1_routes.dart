import 'package:finance/private/core/constants/environment.dart';
import 'package:finance/private/core/constants/strings.dart';
import 'package:finance/private/navigation/base_routes.dart';
import 'package:finance/private/navigation/navigation_route.dart';
import 'package:finance/private/src/category1/repository/mock/mock_category1_fetch_all_with_averagerepository.dart';
import 'package:finance/private/src/category1/repository/remote/remote_category1_fetch_all_with_average_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/category1_fetch_bloc.dart';
import '../../../../private/src/category1/repository/category1_repository_interface.dart';
import '../pages/category1_details_page.dart';

part '../../injection/injection.dart';

class Category1Routes implements NavigationRoute<RoutePath> {
  @override
  Page routes({required RoutePath route, dynamic params}) =>
    MaterialPage(
      key: ValueKey(AppStrings.category1DetailsTitle.value),
      child: _Injection(
        child: Category1DetailsPage(
          title: AppStrings.category1DetailsTitle.value,
          category1fetchModel: params['category'],
        ),
      ),
    );

  const Category1Routes();
}
