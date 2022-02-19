import 'package:json_annotation/json_annotation.dart';

part 'media_keywords.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MovieKeywords {
  final int id;
  @JsonKey(name: 'keywords')
  final List<Keyword> keywords;

  MovieKeywords({
    required this.id,
    required this.keywords,
  });

  factory MovieKeywords.fromJson(Map<String, dynamic> json) =>
      _$MovieKeywordsFromJson(json);
  Map<String, dynamic> toJson() => _$MovieKeywordsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ShowKeywords {
  final int id;
  @JsonKey(name: 'results')
  final List<Keyword> keywords;

  ShowKeywords({
    required this.id,
    required this.keywords,
  });

  factory ShowKeywords.fromJson(Map<String, dynamic> json) =>
      _$ShowKeywordsFromJson(json);
  Map<String, dynamic> toJson() => _$ShowKeywordsToJson(this);
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
