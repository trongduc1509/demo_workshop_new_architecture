// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genred_movie_param_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenredMovieUsecaseParams _$GenredMovieUsecaseParamsFromJson(
        Map<String, dynamic> json) =>
    GenredMovieUsecaseParams(
      apiKey: json['api_key'] as String?,
      genreCode: json['genre_ids'] as int?,
    );

Map<String, dynamic> _$GenredMovieUsecaseParamsToJson(
        GenredMovieUsecaseParams instance) =>
    <String, dynamic>{
      'api_key': instance.apiKey,
      'genre_ids': instance.genreCode,
    };
