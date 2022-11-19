import 'package:demo_workshop/base/route/route_name.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModuleRoute extends ModuleRouteName {
  static HomeModuleRoute? _root;

  static HomeModuleRoute get root => _root!;

  factory HomeModuleRoute(String route, {RouteName? parent}) {
    _root ??= HomeModuleRoute._(route, parent: parent);
    return _root!;
  }

  const HomeModuleRoute._(String route, {RouteName? parent})
      : super(
          route,
          parent: parent,
        );

  RouteName get home => RouteName(this, '/');
}
