import 'package:json_annotation/json_annotation.dart';

part 'user_details.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class UserDetails {
  final Avatar avatar;
  final int id;
  @JsonKey(name: 'iso_639_1')
  final String iso6391;
  @JsonKey(name: 'iso_3166_1')
  final String iso31661;
  final String name;
  @JsonKey(name: 'include_adult')
  final bool includeAdult;
  final String username;
  UserDetails({
    required this.avatar,
    required this.id,
    required this.iso6391,
    required this.iso31661,
    required this.name,
    required this.includeAdult,
    required this.username,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$UserDetailsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Avatar {
  final Gravatar gravatar;
  Avatar({
    required this.gravatar,
  });

  factory Avatar.fromJson(Map<String, dynamic> json) => _$AvatarFromJson(json);
  Map<String, dynamic> toJson() => _$AvatarToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Gravatar {
  final String hash;
  Gravatar({
    required this.hash,
  });

  factory Gravatar.fromJson(Map<String, dynamic> json) =>
      _$GravatarFromJson(json);
  Map<String, dynamic> toJson() => _$GravatarToJson(this);
}
