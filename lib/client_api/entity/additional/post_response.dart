import 'package:json_annotation/json_annotation.dart';

part 'post_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PostResponse {
  final int statusCode;
  final String statusMessage;
  PostResponse({
    required this.statusCode,
    required this.statusMessage,
  });

  factory PostResponse.fromJson(Map<String, dynamic> json) => _$PostResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PostResponseToJson(this);
}
