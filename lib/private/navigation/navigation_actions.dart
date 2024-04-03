import 'package:finance/private/navigation/base_routes.dart';
import 'package:flutter/material.dart';

abstract interface class NavigationAction<T> {
  void Function(T route, {dynamic params}) get navigate;
  void Function(T baseRoute, {T route, dynamic params}) get replace;
  void Function([dynamic params]) get pop;
  
  static NavigationAction<T> of<T extends RoutePath>(BuildContext context) => context.dependOnInheritedWidgetOfExactType<NavigationActionImpl<T>>()!;
}

class NavigationActionImpl<T> extends InheritedWidget implements NavigationAction<T> {
  final void Function(T route, {dynamic params}) _navigate;
  @override
  void Function(T route, {dynamic params}) get navigate =>_navigate;

  final void Function([dynamic params]) _pop;
  @override
  void Function([dynamic params]) get pop => _pop;

  final void Function(T baseRoute, {T route, dynamic params}) _replace;
  @override
  void Function(T baseRoute, {T route, dynamic params}) get replace => _replace;

  const NavigationActionImpl({
    super.key, 
    required void Function(T route, {dynamic params}) navigate,
    required void Function([dynamic params]) pop, 
    required void Function(T baseRoute, {T route, dynamic params}) replace,
    required super.child,
  }) : _navigate = navigate,
      _pop = pop,
      _replace = replace;
      
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

}