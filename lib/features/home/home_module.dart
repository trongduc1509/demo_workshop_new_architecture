import 'package:demo_workshop/features/home/data/datasource/home/remote_data/home_remote_datasource.dart';
import 'package:demo_workshop/features/home/data/repositories/home_repository_impl.dart';
import 'package:demo_workshop/features/home/domain/usecases/genred_movies_usecases/genred_movie_param_usecase.dart';
import 'package:demo_workshop/features/home/domain/usecases/genred_movies_usecases/genred_movie_usecase.dart';
import 'package:demo_workshop/features/home/home.dart';
import 'package:demo_workshop/features/home/presentation/blocs/genre_movie/genre_movie_bloc.dart';
import 'package:demo_workshop/gateways/main_gateway.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/views/home_page.dart';

class HomeModule extends Module {
  HomeModule();

  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton<GenreMovieBloc>(
          (i) => GenreMovieBloc(),
        ),
        Bind.lazySingleton<GenredMoviesRemoteDatasource>(
          (i) => GenredMoviesRemoteDatasource(
            gateway: i.get<MainGateway>(),
          ),
        ),
        Bind.lazySingleton<HomeRepositoryV1>(
          (i) => HomeRepositoryV1(
            genredMoviesRemoteDatasource: i.get<GenredMoviesRemoteDatasource>(),
          ),
        ),
        Bind.lazySingleton<GenredMovieUsecase>(
          (i) => GenredMovieUsecase(
            repo: i.get<HomeRepositoryV1>(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          HomeModuleRoute.root.home.route,
          child: (context, args) => HomePage(),
        ),
      ];
}
