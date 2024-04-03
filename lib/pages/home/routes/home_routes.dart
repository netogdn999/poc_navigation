import 'package:finance/private/core/constants/strings.dart';
import 'package:finance/private/navigation/base_routes.dart';
import 'package:finance/private/navigation/navigation_route.dart';
import 'package:flutter/material.dart';

import '../home_page.dart';

class HomeRoutes implements NavigationRoute<RoutePath> {

  @override
  Page routes({required RoutePath route, dynamic params}) =>
    MaterialPage(
      key: ValueKey(AppStrings.homeTitle.value),
      child: HomePage(
        title: AppStrings.homeTitle.value,
      ),
    );

  const HomeRoutes();
}