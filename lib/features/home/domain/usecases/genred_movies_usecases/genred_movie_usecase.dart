import 'package:dartz/dartz.dart';
import 'package:demo_workshop/base/usecase/usecase.base.dart';
import 'package:demo_workshop/features/home/domain/repositories/home_repository.dart';
import 'package:sample_exception/sample_exception.dart';

import '../../entities/genred_movie_entity.dart';
import 'genred_movie_param_usecase.dart';

class GenredMovieUsecase
    with
        UseCase<GenredMovieUsecaseParams,
            Either<SampleException, List<GenredMovieEntity>>> {
  GenredMovieUsecase({
    required this.repo,
  });

  final HomeRepository repo;

  @override
  Future<Either<SampleException, List<GenredMovieEntity>>> execute(
      GenredMovieUsecaseParams params) {
    return repo.getGenredMovies(params.toJson());
  }
}
