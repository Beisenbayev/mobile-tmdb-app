// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shows_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowsResponse _$ShowsResponseFromJson(Map<String, dynamic> json) =>
    ShowsResponse(
      page: json['page'] as int,
      shows: (json['results'] as List<dynamic>)
          .map((e) => Show.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalResults: json['total_results'] as int,
      totalPages: json['total_pages'] as int,
    );

Map<String, dynamic> _$ShowsResponseToJson(ShowsResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.shows.map((e) => e.toJson()).toList(),
      'total_results': instance.totalResults,
      'total_pages': instance.totalPages,
    };
