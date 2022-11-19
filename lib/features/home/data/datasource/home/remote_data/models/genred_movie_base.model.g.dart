// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genred_movie_base.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenredMovieBaseModel _$GenredMovieBaseModelFromJson(
        Map<String, dynamic> json) =>
    GenredMovieBaseModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      posterPath: json['poster_path'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      voteAverageNum: (json['vote_average'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GenredMovieBaseModelToJson(
        GenredMovieBaseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
      'vote_average': instance.voteAverageNum,
    };
