import 'package:json_annotation/json_annotation.dart';
import 'package:moovee_land/client_api/entity/movie.dart';

part 'movies_response_with_date.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MoviesResponseWithDate {
  final int page;
  @JsonKey(name: 'results')
  final List<Movie> movies;
  final DateRange dates;
  final int totalResults;
  final int totalPages;

  MoviesResponseWithDate({
    required this.page,
    required this.movies,
    required this.dates,
    required this.totalResults,
    required this.totalPages,
  });

  factory MoviesResponseWithDate.fromJson(Map<String, dynamic> json) =>
      _$MoviesResponseWithDateFromJson(json);
  Map<String, dynamic> toJson() => _$MoviesResponseWithDateToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class DateRange {
  final String maximum;
  final String minimum;

  DateRange({
    required this.maximum,
    required this.minimum,
  });

  factory DateRange.fromJson(Map<String, dynamic> json) =>
      _$DateRangeFromJson(json);
  Map<String, dynamic> toJson() => _$DateRangeToJson(this);
}
