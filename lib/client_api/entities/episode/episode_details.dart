import 'package:json_annotation/json_annotation.dart';
import 'package:moovee_land/client_api/entities/entity_utils.dart';

part 'episode_details.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class EpisodeDetails {
  @JsonKey(fromJson: EntityUtils.timeFromString)
  final DateTime? airDate;
  final List<Crew> crew;
  final int episodeNumber;
  final List<GuestStar> guestStars;
  final String name;
  final String overview;
  final int id;
  final String? productionCode;
  final int seasonNumber;
  final String? stillPath;
  final double voteAverage;
  final int voteCount;
  EpisodeDetails({
    required this.airDate,
    required this.crew,
    required this.episodeNumber,
    required this.guestStars,
    required this.name,
    required this.overview,
    required this.id,
    required this.productionCode,
    required this.seasonNumber,
    required this.stillPath,
    required this.voteAverage,
    required this.voteCount,
  });

  factory EpisodeDetails.fromJson(Map<String, dynamic> json) =>
      _$EpisodeDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$EpisodeDetailsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Crew {
  final int id;
  final String creditId;
  final String name;
  final String department;
  final String job;
  final String? profilePath;
  Crew({
    required this.id,
    required this.creditId,
    required this.name,
    required this.department,
    required this.job,
    required this.profilePath,
  });

  factory Crew.fromJson(Map<String, dynamic> json) => _$CrewFromJson(json);
  Map<String, dynamic> toJson() => _$CrewToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GuestStar {
  final int id;
  final String name;
  final String creditId;
  final String character;
  final int order;
  final String? profilePath;
  GuestStar({
    required this.id,
    required this.name,
    required this.creditId,
    required this.character,
    required this.order,
    required this.profilePath,
  });

  factory GuestStar.fromJson(Map<String, dynamic> json) =>
      _$GuestStarFromJson(json);
  Map<String, dynamic> toJson() => _$GuestStarToJson(this);
}
