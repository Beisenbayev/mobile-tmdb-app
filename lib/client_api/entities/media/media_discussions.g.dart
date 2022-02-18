// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_discussions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaDiscussions _$MediaDiscussionsFromJson(Map<String, dynamic> json) =>
    MediaDiscussions(
      id: json['id'] as int,
      page: json['page'] as int,
      reviews: (json['results'] as List<dynamic>)
          .map((e) => Discussion.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] as int,
      totalResults: json['total_results'] as int,
    );

Map<String, dynamic> _$MediaDiscussionsToJson(MediaDiscussions instance) =>
    <String, dynamic>{
      'id': instance.id,
      'page': instance.page,
      'results': instance.reviews.map((e) => e.toJson()).toList(),
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };

Discussion _$DiscussionFromJson(Map<String, dynamic> json) => Discussion(
      author: json['author'] as String,
      authorDetails: AuthorDetails.fromJson(
          json['author_details'] as Map<String, dynamic>),
      content: json['content'] as String,
      createdAt: EntityUtils.timeFromString(json['created_at'] as String?),
      id: json['id'] as String,
      updatedAt: EntityUtils.timeFromString(json['updated_at'] as String?),
      url: json['url'] as String,
    );

Map<String, dynamic> _$DiscussionToJson(Discussion instance) =>
    <String, dynamic>{
      'author': instance.author,
      'author_details': instance.authorDetails.toJson(),
      'content': instance.content,
      'created_at': instance.createdAt?.toIso8601String(),
      'id': instance.id,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'url': instance.url,
    };

AuthorDetails _$AuthorDetailsFromJson(Map<String, dynamic> json) =>
    AuthorDetails(
      name: json['name'] as String,
      username: json['username'] as String,
      avatarPath: json['avatar_path'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AuthorDetailsToJson(AuthorDetails instance) =>
    <String, dynamic>{
      'name': instance.name,
      'username': instance.username,
      'avatar_path': instance.avatarPath,
      'rating': instance.rating,
    };
