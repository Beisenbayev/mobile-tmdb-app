// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_discussions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDiscussions _$MovieDiscussionsFromJson(Map<String, dynamic> json) =>
    MovieDiscussions(
      id: json['id'] as int,
      page: json['page'] as int,
      discussions: (json['results'] as List<dynamic>)
          .map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] as int,
      totalResults: json['total_results'] as int,
    );

Map<String, dynamic> _$MovieDiscussionsToJson(MovieDiscussions instance) =>
    <String, dynamic>{
      'id': instance.id,
      'page': instance.page,
      'results': instance.discussions.map((e) => e.toJson()).toList(),
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      author: json['author'] as String,
      authorDetails: AuthorDetails.fromJson(
          json['author_details'] as Map<String, dynamic>),
      content: json['content'] as String,
      createdAt: EntityUtils.timeFromString(json['created_at'] as String?),
      id: json['id'] as String,
      updatedAt: EntityUtils.timeFromString(json['updated_at'] as String?),
      url: json['url'] as String,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
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
      rating: json['rating'] as int?,
    );

Map<String, dynamic> _$AuthorDetailsToJson(AuthorDetails instance) =>
    <String, dynamic>{
      'name': instance.name,
      'username': instance.username,
      'avatar_path': instance.avatarPath,
      'rating': instance.rating,
    };
