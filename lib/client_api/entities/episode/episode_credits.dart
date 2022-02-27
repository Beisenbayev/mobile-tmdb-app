import 'package:json_annotation/json_annotation.dart';

part 'episode_credits.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class EpisodeCredits {
  final List<Cast> cast;
  final List<Crew> crew;
  final List<GuestStar> guestStars;
  final int id;
  EpisodeCredits({
    required this.cast,
    required this.crew,
    required this.guestStars,
    required this.id,
  });

  factory EpisodeCredits.fromJson(Map<String, dynamic> json) =>
      _$EpisodeCreditsFromJson(json);
  Map<String, dynamic> toJson() => _$EpisodeCreditsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Cast {
  final bool adult;
  final int? gender;
  final int id;
  final String? knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String? profilePath;
  final String character;
  final String creditId;
  final int order;
  Cast({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.character,
    required this.creditId,
    required this.order,
  });

  factory Cast.fromJson(Map<String, dynamic> json) =>
      _$CastFromJson(json);
  Map<String, dynamic> toJson() => _$CastToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Crew {
  final String? department;
  final String job;
  final String creditId;
  final bool adult;
  final int? gender;
  final int id;
  final String knownForDepartment;
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

  factory Crew.fromJson(Map<String, dynamic> json) =>
      _$CrewFromJson(json);
  Map<String, dynamic> toJson() => _$CrewToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GuestStar {
  final String? characterName;
  final String creditId;
  final int order;
  final bool adult;
  final int? gender;
  final int id;
  final String? knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String? profilePath;
  GuestStar({
    required this.characterName,
    required this.creditId,
    required this.order,
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
