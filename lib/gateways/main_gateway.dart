import 'package:demo_workshop/base/gateway/api_gateway.base.dart';
import 'package:dio/dio.dart';

import '../base/gateway/interceptors/interceptors.dart';
import '../config/configurations.dart';

class MainGateway extends ApiGateway {
  MainGateway(String endpoint, List<Interceptor> interceptors)
      : super(
          endpoint,
          interceptors: interceptors,
        );

  factory MainGateway.fromConfig(
    Config config,
    CreateInterceptors interceptors,
  ) {
    final _interceptors = interceptors.call();
    return MainGateway(config.urlGateway, _interceptors);
  }
}
