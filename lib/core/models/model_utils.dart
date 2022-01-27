import 'package:flutter/material.dart';
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

  static String getYearFromDate(DateTime? date) {
    return (date != null) ? date.year.toString() : '';
  }

  static String getHourFromMinute(int minute) {
    return '';
  }

  static void getMovieInfo() {
    
  }
}
