import 'package:demo_workshop/features/home/data/datasource/home/remote_data/home_remote_datasource.dart';
import 'package:demo_workshop/features/home/domain/entities/genred_movie_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:demo_workshop/features/home/domain/repositories/home_repository.dart';
import 'package:sample_exception/sample_exception.dart';

class HomeRepositoryV1 extends HomeRepository {
  HomeRepositoryV1({
    required this.genredMoviesRemoteDatasource,
  });

  final GenredMoviesRemoteDatasource genredMoviesRemoteDatasource;

  @override
  Future<Either<SampleException, List<GenredMovieEntity>>> getGenredMovies(
      Map<String, dynamic> params) async {
    try {
      final result =
          await genredMoviesRemoteDatasource.listGenredMovies(params);
      return Right(result);
    } on SampleException catch (s) {
      return Left(s);
    } on Exception catch (e) {
      return Left(SampleException(
        SampleErrorCode.connectionFail,
        error: e,
        message: 'Lỗi lấy danh sách phim',
        debugMessage: 'get genred movies',
      ));
    }
  }
}
