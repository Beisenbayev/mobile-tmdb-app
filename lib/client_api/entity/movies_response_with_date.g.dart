// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_response_with_date.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesResponseWithDate _$MoviesResponseWithDateFromJson(
        Map<String, dynamic> json) =>
    MoviesResponseWithDate(
      page: json['page'] as int,
      movies: (json['results'] as List<dynamic>)
          .map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
      dates: DateRange.fromJson(json['dates'] as Map<String, dynamic>),
      totalResults: json['total_results'] as int,
      totalPages: json['total_pages'] as int,
    );

Map<String, dynamic> _$MoviesResponseWithDateToJson(
        MoviesResponseWithDate instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.movies.map((e) => e.toJson()).toList(),
      'dates': instance.dates.toJson(),
      'total_results': instance.totalResults,
      'total_pages': instance.totalPages,
    };
