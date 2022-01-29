import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moovee_land/client_api/api_config.dart';
import 'package:moovee_land/client_api/entity/movie_videos.dart';

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

  static Widget getActorImage(String? path) {
    final imageUrl = (path != null) ? ApiUtils.getImageUrl(path) : '';

    return (imageUrl.isNotEmpty)
        ? Image.network(imageUrl, fit: BoxFit.cover)
        : Image.asset('assets/images/cast-avatar.png', fit: BoxFit.cover);
  }

  static Widget getSecuredActorImage(String? path) {
    if (path != null && path.substring(0, 6) == '/https') {
      return Image.network(path.substring(1), fit: BoxFit.cover);
    }

    final imageUrl = (path != null) ? ApiUtils.getImageUrl(path) : '';

    return (imageUrl.isNotEmpty)
        ? Image.network(imageUrl, fit: BoxFit.cover)
        : Image.asset('assets/images/cast-avatar.png', fit: BoxFit.cover);
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

  static String getCashFormatFromInt(int? number) {
    if (number == null) return '';

    final String cash = number.toString();
    String cashFormat = '';
    for (int i = cash.length - 1, j = 1; i >= 0; i--, j++) {
      cashFormat += number.toString()[i];

      if (j % 3 == 0 && j != cash.length) cashFormat += ',';
    }

    return '\$' + cashFormat.split('').reversed.join();
  }

  static String getOfficialTrailerKey(List<Trailer> trailers) {
    if (trailers.isEmpty) return '';

    final _youTubeTrailers = trailers.where((item) {
      return item.site == 'YouTube' && item.key.isNotEmpty;
    }).toList();

    final _officialTrailers = _youTubeTrailers.where((item) {
      return item.official;
    }).toList();

    if (_officialTrailers.isNotEmpty) {
      return _officialTrailers[0].key;
    } else if (_youTubeTrailers.isNotEmpty) {
      return _youTubeTrailers[0].key;
    } else {
      return '';
    }
  }
}
