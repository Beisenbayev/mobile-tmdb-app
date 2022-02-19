// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_keywords.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieKeywords _$MovieKeywordsFromJson(Map<String, dynamic> json) =>
    MovieKeywords(
      id: json['id'] as int,
      keywords: (json['keywords'] as List<dynamic>)
          .map((e) => Keyword.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieKeywordsToJson(MovieKeywords instance) =>
    <String, dynamic>{
      'id': instance.id,
      'keywords': instance.keywords.map((e) => e.toJson()).toList(),
    };

ShowKeywords _$ShowKeywordsFromJson(Map<String, dynamic> json) => ShowKeywords(
      id: json['id'] as int,
      keywords: (json['results'] as List<dynamic>)
          .map((e) => Keyword.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ShowKeywordsToJson(ShowKeywords instance) =>
    <String, dynamic>{
      'id': instance.id,
      'results': instance.keywords.map((e) => e.toJson()).toList(),
    };

Keyword _$KeywordFromJson(Map<String, dynamic> json) => Keyword(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$KeywordToJson(Keyword instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
