import 'package:demo_workshop/features/home/domain/entities/genred_movie_entity.dart';
import 'package:demo_workshop/features/home/domain/usecases/genred_movies_usecases/genred_movie_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sample_exception/sample_exception.dart';

import '../../../../../config/configurations.dart';
import '../../../domain/usecases/genred_movies_usecases/genred_movie_param_usecase.dart';

part 'genre_movie_event.dart';

part 'genre_movie_state.dart';

class GenreMovieBloc extends Bloc<GenreMovieEvent, GenreMovieState> {
  GenreMovieBloc() : super(GenreMovieInitialState()) {
    on<GenreMovieLoadEvent>(_onLoadEvent);
  }

  final GenredMovieUsecase genredMovieUsecase =
      Modular.get<GenredMovieUsecase>();
  final Config config = Modular.get<Config>();

  void _onLoadEvent(GenreMovieLoadEvent event, emit) async {
    emit(GenreMovieLoadingState());
    var res = await genredMovieUsecase.execute(GenredMovieUsecaseParams(
      apiKey: config.apiKey,
      genreCode: event.genreCode,
    ));
    res.fold(
      (l) => emit(GenreMovieErrorState(error: l)),
      (r) => emit(GenreMovieDoneState(movies: r)),
    );
  }
}
