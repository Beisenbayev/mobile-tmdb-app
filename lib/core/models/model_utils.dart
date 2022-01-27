import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moovee_land/client_api/api_config.dart';

class ModelUtils {
  static Widget getPosterImage(String? path) {
    final imageUrl = (path != null) ? ApiUtils.getImageUrl(path) : '';

    return (imageUrl.isNotEmpty)
        ? Image.network(imageUrl, fit: BoxFit.cover)
        : Image.asset('assets/images/film-poster.png', fit: BoxFit.cover);
  }

  static Widget getBackdropImage(String? path) {
    final imageUrl = (path != null) ? ApiUtils.getImageUrl(path) : '';

    return (imageUrl.isNotEmpty)
        ? Image.network(imageUrl, fit: BoxFit.cover)
        : Image.asset('assets/images/film-backdrop.png', fit: BoxFit.cover);
  }

  static String parseDateTime(DateTime? date, String timeFormat) {
    if (date == null) return '';
    return DateFormat(timeFormat).format(date);
  }

  static String getHoursFromMinute(int? minutes) {
    if (minutes == null) return '';

    final String hours = (minutes ~/ 60 != 0) ? '${minutes ~/ 60}h' : '';
    final String leftMinutes = (minutes % 60 != 0) ? '${minutes % 60}m' : '';
    return '$hours $leftMinutes';
  }
}
