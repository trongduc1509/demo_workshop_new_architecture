import 'package:dartz/dartz.dart';
import 'package:demo_workshop/features/home/domain/entities/genred_movie_entity.dart';
import 'package:sample_exception/sample_exception.dart';

abstract class HomeRepository {
  Future<Either<SampleException, List<GenredMovieEntity>>> getGenredMovies(
      Map<String, dynamic> params);
}
