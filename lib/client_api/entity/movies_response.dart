import 'package:json_annotation/json_annotation.dart';
import 'package:moovee_land/client_api/entity/movie.dart';

part 'movies_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MoviesResponse {
  final int page;
  @JsonKey(name: 'results')
  final List<Movie> movies;
  final int totalResults;
  final int totalPages;

  MoviesResponse({
    required this.page,
    required this.movies,
    required this.totalResults,
    required this.totalPages,
  });

  factory MoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$MoviesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MoviesResponseToJson(this);
}
