import 'package:flutter/material.dart';

import 'base_routes.dart';
import 'navigation_actions.dart';
import 'navigation_state.dart';

class NavigationDelegate extends RouterDelegate<Object>
  with ChangeNotifier, PopNavigatorRouterDelegateMixin<Object> {

  final NavigationState state;
  
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey navigatorActionKey = GlobalKey();

  @override
  Object? get currentConfiguration => null;

  NavigationDelegate({required this.state}): super() {
    state.addListener(notifyListeners);
  }

  @override
  void dispose() {
    state.removeListener(notifyListeners);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NavigationActionImpl<RoutePath>(
      key: navigatorActionKey,
      navigate: navigate,
      replace: replace,
      pop: popPage,
      child: Navigator(
        key: navigatorKey,
        pages: List.of(state.stack),
        onPopPage: (route, result) => !route.didPop(result) ? false : popPage(result),
      ),
    );
  }

  void navigate(RoutePath path, {dynamic params}) => state.addRoute(path, params: params);
  void replace(RoutePath path, {RoutePath? route, dynamic params}) => state.setRoute(path, subRoute: route, params: params);
  bool popPage([dynamic params]) => state.removeRoute(params);
  
  @override
  Future<bool> popRoute() async => popPage();

  @override
  Future<void> setNewRoutePath(Object configuration) async {}
}