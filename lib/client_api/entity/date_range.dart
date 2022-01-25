import 'package:json_annotation/json_annotation.dart';

part 'date_range.g.dart';

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
