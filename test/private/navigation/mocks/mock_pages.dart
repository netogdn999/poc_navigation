import 'package:finance/private/navigation/base_routes.dart';
import 'package:finance/private/navigation/navigation_actions.dart';
import 'package:finance/private/navigation/navigation_route.dart';
import 'package:flutter/material.dart';

class MockPageRouteOne implements NavigationRoute<RoutePath> {

  const MockPageRouteOne();

  @override
  Page routes({required RoutePath route, params}) => switch(route) {
    BaseRoutes.home => const MaterialPage(child: MockPageOne()),
    _ => EmptyRoute()
  };

}

class MockPageOne extends StatelessWidget {
  const MockPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('home page'),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () => NavigationAction.of(context).navigate(BaseRoutes.typeRecord),
            child: Container(),
          ),
          ElevatedButton(
            onPressed: () => NavigationAction.of(context).replace(BaseRoutes.typeRecord, route: SubRoutes.incomeStatementAccountDetails),
            child: Container(),
          ),
          FilledButton(
            onPressed: () => NavigationAction.of(context).replace(BaseRoutes.category1Details, route: SubRoutes.incomeStatementAccountDetails),
            child: Container(),
          ),
          OutlinedButton(
            onPressed: () => NavigationAction.of(context).navigate(SubRoutes.incomeStatementAccountDetails),
            child: Container(),
          ),
        ]
      ),
    );
  }
}

class MockPageRouteTwo implements NavigationRoute<RoutePath> {
  const MockPageRouteTwo();

  @override
  Page routes({required RoutePath route, params}) => switch(route) {
    BaseRoutes.typeRecord => const MaterialPage(child: MockPageTwo()),
    SubRoutes.incomeStatementAccountDetails => const MaterialPage(child: MockPageThird()),
    _ => EmptyRoute()
  };

}

class MockPageTwo extends StatelessWidget {
  const MockPageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () => NavigationAction.of(context).navigate(SubRoutes.incomeStatementAccountDetails),
          child: Container(),
        ),
      ),
    );
  }
}

class MockPageThird extends StatelessWidget {
  const MockPageThird({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Page'),
      ),
    );
  }
}