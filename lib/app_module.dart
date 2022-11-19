import 'package:demo_workshop/app_route.dart';
import 'package:demo_workshop/base/gateway/interceptors/authentication_interceptor.dart';
import 'package:demo_workshop/base/gateway/interceptors/interceptors.dart';
import 'package:demo_workshop/features/home/home.dart';
import 'package:demo_workshop/gateways/main_gateway.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'config/configurations.dart';

class AppModule extends Module {
  AppModule();

  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton<Config>(
          (i) => Config.load(),
        ),
        Bind.lazySingleton<CreateInterceptors>((i) => () => [
              //AuthenticationInterceptor(),
            ]),
        Bind.lazySingleton<MainGateway>(
          (i) => MainGateway.fromConfig(
            i.get<Config>(),
            i.get<CreateInterceptors>(),
          ),
        )
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          AppRoute.home.route,
          module: HomeModule(),
        ),
      ];
}
