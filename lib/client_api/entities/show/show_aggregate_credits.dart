import 'package:json_annotation/json_annotation.dart';

part 'show_aggregate_credits.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ShowAggregateCredits {
  final int id;
  final List<Cast> cast;
  final List<Crew> crew;
  ShowAggregateCredits({
    required this.id,
    required this.cast,
    required this.crew,
  });

  factory ShowAggregateCredits.fromJson(Map<String, dynamic> json) =>
      _$ShowAggregateCreditsFromJson(json);
  Map<String, dynamic> toJson() => _$ShowAggregateCreditsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Cast {
  final bool adult;
  final int? gender;
  final int id;
  final String? knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String? profilePath;
  final List<Role> roles;
  final int totalEpisodeCount;
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
    required this.roles,
    required this.totalEpisodeCount,
    required this.order,
  });

  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);
  Map<String, dynamic> toJson() => _$CastToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Role {
  final String creditId;
  final String character;
  final int episodeCount;
  Role({
    required this.creditId,
    required this.character,
    required this.episodeCount,
  });

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);
  Map<String, dynamic> toJson() => _$RoleToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Crew {
  final bool adult;
  final int? gender;
  final int id;
  final String? knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String? profilePath;
  final List<Job> jobs;
  final String department;
  final int totalEpisodeCount;
  Crew({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.jobs,
    required this.department,
    required this.totalEpisodeCount,
  });

  factory Crew.fromJson(Map<String, dynamic> json) => _$CrewFromJson(json);
  Map<String, dynamic> toJson() => _$CrewToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Job {
  final String creditId;
  final String job;
  final int episodeCount;
  Job({
    required this.creditId,
    required this.job,
    required this.episodeCount,
  });

  factory Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);
  Map<String, dynamic> toJson() => _$JobToJson(this);
}
