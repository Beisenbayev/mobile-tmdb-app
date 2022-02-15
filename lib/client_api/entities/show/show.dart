import 'package:json_annotation/json_annotation.dart';

part 'show.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Show {
  final String? posterPath;
  final double popularity;
  final int id;
  final String? backdropPath;
  final double voteAverage;
  final String overview;
  @JsonKey(fromJson: _timeFromString)
  final DateTime? firstAirDate;
  final List<String> originCountry;
  final List<int> genreIds;
  final String originalLanguage;
  final int voteCount;
  final String name;
  final String originalName;

  Show({
    required this.posterPath,
    required this.popularity,
    required this.id,
    required this.backdropPath,
    required this.voteAverage,
    required this.overview,
    required this.firstAirDate,
    required this.originCountry,
    required this.genreIds,
    required this.originalLanguage,
    required this.voteCount,
    required this.name,
    required this.originalName,
  });

  factory Show.fromJson(Map<String, dynamic> json) => _$ShowFromJson(json);
  Map<String, dynamic> toJson() => _$ShowToJson(this);

  static DateTime? _timeFromString(String? date) {
    return (date == null || date.isEmpty) ? null : DateTime.tryParse(date);
  }
}
