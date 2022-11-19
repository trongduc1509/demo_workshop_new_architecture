import 'package:json_annotation/json_annotation.dart';

part 'genred_movie_param_usecase.g.dart';

@JsonSerializable()
class GenredMovieUsecaseParams {
  const GenredMovieUsecaseParams({
    this.apiKey,
    this.genreCode,
  });

  @JsonKey(name: 'api_key')
  final String? apiKey;
  @JsonKey(name: 'genre_ids')
  final int? genreCode;

  Map<String, dynamic> toJson() => _$GenredMovieUsecaseParamsToJson(this);
}
