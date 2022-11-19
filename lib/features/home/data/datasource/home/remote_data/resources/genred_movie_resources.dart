import 'package:demo_workshop/base/domain/resource.base.dart';

class GenredMoviesResource extends Resource {
  GenredMoviesResource()
      : super(
          '/discover/movie',
          description: 'genred movies',
        );
}
