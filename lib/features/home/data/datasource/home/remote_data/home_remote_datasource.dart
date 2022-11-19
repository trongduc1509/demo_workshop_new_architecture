import 'package:demo_workshop/base/gateway/api_gateway.base.dart';
import 'package:demo_workshop/features/home/data/datasource/home/remote_data/models/genred_movie_base.model.dart';
import 'package:demo_workshop/features/home/data/datasource/home/remote_data/resources/genred_movie_resources.dart';

class GenredMoviesRemoteDatasource {
  const GenredMoviesRemoteDatasource({
    required this.gateway,
  });

  final ApiGateway gateway;

  Future<List<GenredMovieBaseModel>> listGenredMovies(
      Map<String, dynamic> params) async {
    final response = await gateway.execute(
      resource: GenredMoviesResource(),
      method: HTTPMethod.get,
      params: params,
    );
    return (response.data['results'] as List)
        .map((e) => GenredMovieBaseModel.fromJson(e))
        .toList();
  }
}
