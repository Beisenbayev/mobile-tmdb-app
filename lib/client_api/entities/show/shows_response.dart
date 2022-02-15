import 'package:json_annotation/json_annotation.dart';
import 'package:moovee_land/client_api/entities/show/show.dart';

part 'shows_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ShowsResponse {
  final int page;
  @JsonKey(name: 'results')
  final List<Show> shows;
  final int totalResults;
  final int totalPages;

  ShowsResponse({
    required this.page,
    required this.shows,
    required this.totalResults,
    required this.totalPages,
  });

  factory ShowsResponse.fromJson(Map<String, dynamic> json) =>
      _$ShowsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ShowsResponseToJson(this);
}
