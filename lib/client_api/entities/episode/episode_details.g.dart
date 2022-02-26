// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EpisodeDetails _$EpisodeDetailsFromJson(Map<String, dynamic> json) =>
    EpisodeDetails(
      airDate: EntityUtils.timeFromString(json['air_date'] as String?),
      crew: (json['crew'] as List<dynamic>)
          .map((e) => Crew.fromJson(e as Map<String, dynamic>))
          .toList(),
      episodeNumber: json['episode_number'] as int,
      guestStars: (json['guest_stars'] as List<dynamic>)
          .map((e) => GuestStar.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String,
      overview: json['overview'] as String,
      id: json['id'] as int,
      productionCode: json['production_code'] as String?,
      seasonNumber: json['season_number'] as int,
      stillPath: json['still_path'] as String?,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'] as int,
    );

Map<String, dynamic> _$EpisodeDetailsToJson(EpisodeDetails instance) =>
    <String, dynamic>{
      'air_date': instance.airDate?.toIso8601String(),
      'crew': instance.crew.map((e) => e.toJson()).toList(),
      'episode_number': instance.episodeNumber,
      'guest_stars': instance.guestStars.map((e) => e.toJson()).toList(),
      'name': instance.name,
      'overview': instance.overview,
      'id': instance.id,
      'production_code': instance.productionCode,
      'season_number': instance.seasonNumber,
      'still_path': instance.stillPath,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };

Crew _$CrewFromJson(Map<String, dynamic> json) => Crew(
      id: json['id'] as int,
      creditId: json['credit_id'] as String,
      name: json['name'] as String,
      department: json['department'] as String,
      job: json['job'] as String,
      profilePath: json['profile_path'] as String?,
    );

Map<String, dynamic> _$CrewToJson(Crew instance) => <String, dynamic>{
      'id': instance.id,
      'credit_id': instance.creditId,
      'name': instance.name,
      'department': instance.department,
      'job': instance.job,
      'profile_path': instance.profilePath,
    };

GuestStar _$GuestStarFromJson(Map<String, dynamic> json) => GuestStar(
      id: json['id'] as int,
      name: json['name'] as String,
      creditId: json['credit_id'] as String,
      character: json['character'] as String,
      order: json['order'] as int,
      profilePath: json['profile_path'] as String?,
    );

Map<String, dynamic> _$GuestStarToJson(GuestStar instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'credit_id': instance.creditId,
      'character': instance.character,
      'order': instance.order,
      'profile_path': instance.profilePath,
    };
