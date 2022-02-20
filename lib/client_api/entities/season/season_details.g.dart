// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'season_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeasonDetails _$SeasonDetailsFromJson(Map<String, dynamic> json) =>
    SeasonDetails(
      stringId: json['_id'] as String,
      airDate: EntityUtils.timeFromString(json['air_date'] as String?),
      episodes: (json['episodes'] as List<dynamic>)
          .map((e) => Episode.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String,
      overview: json['overview'] as String,
      id: json['id'] as int,
      posterPath: json['poster_path'] as String?,
      seasonNumber: json['season_number'] as int,
    );

Map<String, dynamic> _$SeasonDetailsToJson(SeasonDetails instance) =>
    <String, dynamic>{
      '_id': instance.stringId,
      'air_date': instance.airDate?.toIso8601String(),
      'episodes': instance.episodes.map((e) => e.toJson()).toList(),
      'name': instance.name,
      'overview': instance.overview,
      'id': instance.id,
      'poster_path': instance.posterPath,
      'season_number': instance.seasonNumber,
    };

Episode _$EpisodeFromJson(Map<String, dynamic> json) => Episode(
      airDate: EntityUtils.timeFromString(json['air_date'] as String?),
      episodeNumber: json['episode_number'] as int,
      crew: (json['crew'] as List<dynamic>)
          .map((e) => Crew.fromJson(e as Map<String, dynamic>))
          .toList(),
      guestStars: (json['guest_stars'] as List<dynamic>)
          .map((e) => GuestStar.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as int,
      name: json['name'] as String,
      overview: json['overview'] as String,
      productionCode: json['production_code'] as String,
      seasonNumber: json['season_number'] as int,
      stillPath: json['still_path'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'] as int,
    );

Map<String, dynamic> _$EpisodeToJson(Episode instance) => <String, dynamic>{
      'air_date': instance.airDate?.toIso8601String(),
      'episode_number': instance.episodeNumber,
      'crew': instance.crew.map((e) => e.toJson()).toList(),
      'guest_stars': instance.guestStars.map((e) => e.toJson()).toList(),
      'id': instance.id,
      'name': instance.name,
      'overview': instance.overview,
      'production_code': instance.productionCode,
      'season_number': instance.seasonNumber,
      'still_path': instance.stillPath,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };

Crew _$CrewFromJson(Map<String, dynamic> json) => Crew(
      department: json['department'] as String,
      job: json['job'] as String,
      creditId: json['credit_id'] as String,
      adult: json['adult'] as bool?,
      gender: json['gender'] as int,
      id: json['id'] as int,
      knownForDepartment: json['known_for_department'] as String?,
      name: json['name'] as String,
      originalName: json['original_name'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      profilePath: json['profile_path'] as String?,
    );

Map<String, dynamic> _$CrewToJson(Crew instance) => <String, dynamic>{
      'department': instance.department,
      'job': instance.job,
      'credit_id': instance.creditId,
      'adult': instance.adult,
      'gender': instance.gender,
      'id': instance.id,
      'known_for_department': instance.knownForDepartment,
      'name': instance.name,
      'original_name': instance.originalName,
      'popularity': instance.popularity,
      'profile_path': instance.profilePath,
    };

GuestStar _$GuestStarFromJson(Map<String, dynamic> json) => GuestStar(
      creditId: json['credit_id'] as String,
      order: json['order'] as int,
      character: json['character'] as String,
      adult: json['adult'] as bool,
      gender: json['gender'] as int?,
      id: json['id'] as int,
      knownForDepartment: json['known_for_department'] as String?,
      name: json['name'] as String,
      originalName: json['original_name'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      profilePath: json['profile_path'] as String?,
    );

Map<String, dynamic> _$GuestStarToJson(GuestStar instance) => <String, dynamic>{
      'credit_id': instance.creditId,
      'order': instance.order,
      'character': instance.character,
      'adult': instance.adult,
      'gender': instance.gender,
      'id': instance.id,
      'known_for_department': instance.knownForDepartment,
      'name': instance.name,
      'original_name': instance.originalName,
      'popularity': instance.popularity,
      'profile_path': instance.profilePath,
    };
