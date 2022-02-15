class EntityUtils {
  static DateTime? timeFromString(String? date) {
    return (date == null || date.isEmpty) ? null : DateTime.tryParse(date);
  }
}
