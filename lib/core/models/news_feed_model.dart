import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moovee_land/client_api/api_config.dart';

class NewsFeedModel extends ChangeNotifier {
  final _timeFormat = DateFormat.yMMMd().format;

  String getImageName(String? path) {
    return (path != null) ? ApiUtils.getImageUrl(path) : '';
  }

  String parseDateTime(DateTime? date) {
    return (date != null) ? _timeFormat(date) : '';
  }
}

class NewsFeedProvider extends InheritedNotifier {
  final NewsFeedModel model;

  const NewsFeedProvider({
    Key? key,
    required child,
    required this.model,
  }) : super(key: key, child: child, notifier: model);

  static NewsFeedProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<NewsFeedProvider>();
  }

  @override
  bool updateShouldNotify(NewsFeedProvider oldWidget) {
    return true;
  }
}
