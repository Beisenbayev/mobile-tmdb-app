import 'package:json_annotation/json_annotation.dart';
import 'package:moovee_land/client_api/entities/entity_utils.dart';

part 'media_discussions.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MediaDiscussions {
  final int id;
  final int page;
  @JsonKey(name: 'results')
  final List<Discussion> reviews;
  final int totalPages;
  final int totalResults;
  MediaDiscussions({
    required this.id,
    required this.page,
    required this.reviews,
    required this.totalPages,
    required this.totalResults,
  });

  factory MediaDiscussions.fromJson(Map<String, dynamic> json) =>
      _$MediaDiscussionsFromJson(json);
  Map<String, dynamic> toJson() => _$MediaDiscussionsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Discussion {
  final String author;
  final AuthorDetails authorDetails;
  final String content;
  @JsonKey(fromJson: EntityUtils.timeFromString)
  final DateTime? createdAt;
  final String id;
  @JsonKey(fromJson: EntityUtils.timeFromString)
  final DateTime? updatedAt;
  final String url;
  Discussion({
    required this.author,
    required this.authorDetails,
    required this.content,
    required this.createdAt,
    required this.id,
    required this.updatedAt,
    required this.url,
  });

  factory Discussion.fromJson(Map<String, dynamic> json) =>
      _$DiscussionFromJson(json);
  Map<String, dynamic> toJson() => _$DiscussionToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class AuthorDetails {
  final String name;
  final String username;
  final String? avatarPath;
  final double? rating;
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
