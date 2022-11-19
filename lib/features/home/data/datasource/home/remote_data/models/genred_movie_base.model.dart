import 'package:demo_workshop/features/home/domain/entities/genred_movie_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'genred_movie_base.model.g.dart';

@JsonSerializable()
class GenredMovieBaseModel extends GenredMovieEntity {
  GenredMovieBaseModel(
      {this.id,
      this.title,
      this.posterPath,
      this.backdropPath,
      this.voteAverageNum})
      : super(
            backdrop: backdropPath ?? '',
            movieTitle: title ?? '',
            voteAverage: voteAverageNum ?? 0.0);

  final int? id;
  final String? title;
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  @JsonKey(name: 'vote_average')
  final double? voteAverageNum;

  static GenredMovieBaseModel fromJson(Map<String, dynamic> json) =>
      _$GenredMovieBaseModelFromJson(json);
}
