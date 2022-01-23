import 'package:json_annotation/json_annotation.dart';
import 'package:moovee_land/client_api/entity/movie.dart';

part 'popular_movies.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class PopularMovies {
  final int page;
  @JsonKey(name: 'results')
  final List<Movie> movies;
  final int totalResults;
  final int totalPages;

  PopularMovies({
    required this.page,
    required this.movies,
    required this.totalResults,
    required this.totalPages,
  });

  factory PopularMovies.fromJson(Map<String, dynamic> json) =>
      _$PopularMoviesFromJson(json);
  Map<String, dynamic> toJson() => _$PopularMoviesToJson(this);
}
