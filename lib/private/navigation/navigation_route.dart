import 'package:flutter/material.dart';

abstract class NavigationRoute<D> {
  Page routes({required D route, dynamic params});
}

class EmptyRoute extends Page {
  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(builder: (_) => Container());
  }
}
