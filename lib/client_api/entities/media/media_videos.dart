import 'package:json_annotation/json_annotation.dart';
import 'package:moovee_land/client_api/entities/entity_utils.dart';

part 'media_videos.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MediaVideos {
  final int id;
  @JsonKey(name: 'results')
  final List<Trailer> trailers;
  MediaVideos({
    required this.id,
    required this.trailers,
  });

  factory MediaVideos.fromJson(Map<String, dynamic> json) =>
      _$MediaVideosFromJson(json);
  Map<String, dynamic> toJson() => _$MediaVideosToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Trailer {
  @JsonKey(name: 'iso_639_1')
  final String iso6391;
  @JsonKey(name: 'iso_3166_1')
  final String iso31661;
  final String name;
  final String key;
  final String site;
  final int size;
  final String type;
  final bool official;
  @JsonKey(fromJson: EntityUtils.timeFromString)
  final DateTime? publishedAt;
  final String id;
  Trailer({
    required this.iso6391,
    required this.iso31661,
    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.publishedAt,
    required this.id,
  });

  factory Trailer.fromJson(Map<String, dynamic> json) =>
      _$TrailerFromJson(json);
  Map<String, dynamic> toJson() => _$TrailerToJson(this);
}
