import 'package:json_annotation/json_annotation.dart';
import 'package:moovee_land/client_api/entities/entity_utils.dart';

part 'cast_details.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class CastDetails {
  @JsonKey(fromJson: EntityUtils.timeFromString)
  final DateTime? birthday;
  final String? knownForDepartment;
  @JsonKey(fromJson: EntityUtils.timeFromString)
  final DateTime? deathday;
  final int id;
  final String name;
  final List<String> alsoKnownAs;
  final int? gender;
  final String biography;
  final double popularity;
  final String? placeOfBirth;
  final String? profilePath;
  final bool adult;
  final String? imdbId;
  final String? homepage;
  CastDetails({
    required this.birthday,
    required this.knownForDepartment,
    required this.deathday,
    required this.id,
    required this.name,
    required this.alsoKnownAs,
    required this.gender,
    required this.biography,
    required this.popularity,
    required this.placeOfBirth,
    required this.profilePath,
    required this.adult,
    required this.imdbId,
    required this.homepage,
  });

  factory CastDetails.fromJson(Map<String, dynamic> json) =>
      _$CastDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$CastDetailsToJson(this);
}
