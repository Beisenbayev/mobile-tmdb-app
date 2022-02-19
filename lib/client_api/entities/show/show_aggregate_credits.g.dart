// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_aggregate_credits.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowAggregateCredits _$ShowAggregateCreditsFromJson(
        Map<String, dynamic> json) =>
    ShowAggregateCredits(
      id: json['id'] as int,
      cast: (json['cast'] as List<dynamic>)
          .map((e) => Cast.fromJson(e as Map<String, dynamic>))
          .toList(),
      crew: (json['crew'] as List<dynamic>)
          .map((e) => Crew.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ShowAggregateCreditsToJson(
        ShowAggregateCredits instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cast': instance.cast.map((e) => e.toJson()).toList(),
      'crew': instance.crew.map((e) => e.toJson()).toList(),
    };

Cast _$CastFromJson(Map<String, dynamic> json) => Cast(
      adult: json['adult'] as bool,
      gender: json['gender'] as int?,
      id: json['id'] as int,
      knownForDepartment: json['known_for_department'] as String?,
      name: json['name'] as String,
      originalName: json['original_name'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      profilePath: json['profile_path'] as String?,
      roles: (json['roles'] as List<dynamic>)
          .map((e) => Role.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalEpisodeCount: json['total_episode_count'] as int,
      order: json['order'] as int,
    );

Map<String, dynamic> _$CastToJson(Cast instance) => <String, dynamic>{
      'adult': instance.adult,
      'gender': instance.gender,
      'id': instance.id,
      'known_for_department': instance.knownForDepartment,
      'name': instance.name,
      'original_name': instance.originalName,
      'popularity': instance.popularity,
      'profile_path': instance.profilePath,
      'roles': instance.roles.map((e) => e.toJson()).toList(),
      'total_episode_count': instance.totalEpisodeCount,
      'order': instance.order,
    };

Role _$RoleFromJson(Map<String, dynamic> json) => Role(
      creditId: json['credit_id'] as String,
      character: json['character'] as String,
      episodeCount: json['episode_count'] as int,
    );

Map<String, dynamic> _$RoleToJson(Role instance) => <String, dynamic>{
      'credit_id': instance.creditId,
      'character': instance.character,
      'episode_count': instance.episodeCount,
    };

Crew _$CrewFromJson(Map<String, dynamic> json) => Crew(
      adult: json['adult'] as bool,
      gender: json['gender'] as int?,
      id: json['id'] as int,
      knownForDepartment: json['known_for_department'] as String?,
      name: json['name'] as String,
      originalName: json['original_name'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      profilePath: json['profile_path'] as String?,
      jobs: (json['jobs'] as List<dynamic>)
          .map((e) => Job.fromJson(e as Map<String, dynamic>))
          .toList(),
      department: json['department'] as String,
      totalEpisodeCount: json['total_episode_count'] as int,
    );

Map<String, dynamic> _$CrewToJson(Crew instance) => <String, dynamic>{
      'adult': instance.adult,
      'gender': instance.gender,
      'id': instance.id,
      'known_for_department': instance.knownForDepartment,
      'name': instance.name,
      'original_name': instance.originalName,
      'popularity': instance.popularity,
      'profile_path': instance.profilePath,
      'jobs': instance.jobs,
      'department': instance.department,
      'total_episode_count': instance.totalEpisodeCount,
    };

Job _$JobFromJson(Map<String, dynamic> json) => Job(
      creditId: json['credit_id'] as String,
      job: json['job'] as String,
      episodeCount: json['episode_count'] as int,
    );

Map<String, dynamic> _$JobToJson(Job instance) => <String, dynamic>{
      'credit_id': instance.creditId,
      'job': instance.job,
      'episode_count': instance.episodeCount,
    };
