import 'package:json_annotation/json_annotation.dart';
import 'package:moovee_land/client_api/entities/entity_utils.dart';

part 'season_details.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class SeasonDetails {
  @JsonKey(name: '_id')
  final String stringId;
  @JsonKey(fromJson: EntityUtils.timeFromString)
  final DateTime? airDate;
  final List<Episode> episodes;
  final String name;
  final String overview;
  final int id;
  final String? posterPath;
  final int seasonNumber;
  SeasonDetails({
    required this.stringId,
    required this.airDate,
    required this.episodes,
    required this.name,
    required this.overview,
    required this.id,
    required this.posterPath,
    required this.seasonNumber,
  });

  factory SeasonDetails.fromJson(Map<String, dynamic> json) =>
      _$SeasonDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$SeasonDetailsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Episode {
  @JsonKey(fromJson: EntityUtils.timeFromString)
  final DateTime? airDate;
  final int episodeNumber;
  final List<Crew> crew;
  final List<GuestStar> guestStars;
  final int id;
  final String name;
  final String overview;
  final String productionCode;
  final int seasonNumber;
  final String? stillPath;
  final double voteAverage;
  final int voteCount;
  Episode({
    required this.airDate,
    required this.episodeNumber,
    required this.crew,
    required this.guestStars,
    required this.id,
    required this.name,
    required this.overview,
    required this.productionCode,
    required this.seasonNumber,
    required this.stillPath,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Episode.fromJson(Map<String, dynamic> json) =>
      _$EpisodeFromJson(json);
  Map<String, dynamic> toJson() => _$EpisodeToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Crew {
  final String department;
  final String job;
  final String creditId;
  final bool? adult;
  final int gender;
  final int id;
  final String? knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String? profilePath;
  Crew({
    required this.department,
    required this.job,
    required this.creditId,
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
  });

  factory Crew.fromJson(Map<String, dynamic> json) => _$CrewFromJson(json);
  Map<String, dynamic> toJson() => _$CrewToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GuestStar {
  final String creditId;
  final int order;
  final String character;
  final bool adult;
  final int? gender;
  final int id;
  final String? knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String? profilePath;
  GuestStar({
    required this.creditId,
    required this.order,
    required this.character,
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
  });

  factory GuestStar.fromJson(Map<String, dynamic> json) =>
      _$GuestStarFromJson(json);
  Map<String, dynamic> toJson() => _$GuestStarToJson(this);
}
