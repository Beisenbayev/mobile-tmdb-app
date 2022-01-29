import 'package:json_annotation/json_annotation.dart';
import 'package:moovee_land/client_api/entity/entity_utils.dart';

part 'movie_discussions.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MovieDiscussions {
  final int id;
  final int page;
  @JsonKey(name: 'results')
  final List<Result> discussions;
  final int totalPages;
  final int totalResults;
  MovieDiscussions({
    required this.id,
    required this.page,
    required this.discussions,
    required this.totalPages,
    required this.totalResults,
  });

  factory MovieDiscussions.fromJson(Map<String, dynamic> json) =>
      _$MovieDiscussionsFromJson(json);
  Map<String, dynamic> toJson() => _$MovieDiscussionsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Result {
  final String author;
  final AuthorDetails authorDetails;
  final String content;
  @JsonKey(fromJson: EntityUtils.timeFromString)
  final DateTime? createdAt;
  final String id;
  @JsonKey(fromJson: EntityUtils.timeFromString)
  final DateTime? updatedAt;
  final String url;
  Result({
    required this.author,
    required this.authorDetails,
    required this.content,
    required this.createdAt,
    required this.id,
    required this.updatedAt,
    required this.url,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class AuthorDetails {
  final String name;
  final String username;
  final String? avatarPath;
  final int? rating;
  AuthorDetails({
    required this.name,
    required this.username,
    required this.avatarPath,
    required this.rating,
  });

  factory AuthorDetails.fromJson(Map<String, dynamic> json) =>
      _$AuthorDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$AuthorDetailsToJson(this);
}
