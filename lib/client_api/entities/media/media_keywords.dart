import 'package:json_annotation/json_annotation.dart';

part 'media_keywords.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MediaKeywords {
  final int id;
  final List<Keyword> keywords;

  MediaKeywords({
    required this.id,
    required this.keywords,
  });

  factory MediaKeywords.fromJson(Map<String, dynamic> json) =>
      _$MediaKeywordsFromJson(json);
  Map<String, dynamic> toJson() => _$MediaKeywordsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Keyword {
  final int id;
  final String name;

  Keyword({
    required this.id,
    required this.name,
  });

  factory Keyword.fromJson(Map<String, dynamic> json) =>
      _$KeywordFromJson(json);
  Map<String, dynamic> toJson() => _$KeywordToJson(this);
}
