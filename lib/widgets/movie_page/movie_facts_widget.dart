import 'package:flutter/material.dart';
import 'package:moovee_land/modules/movie_facts_data.dart';
import 'package:moovee_land/theme/text_theme.dart';

class MovieFactsWidget extends StatelessWidget {
  final List<MovieFact> _movieFacts = MovieFactsCollections.movieFacts;

  MovieFactsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _movieFacts.map((item) {
          return MovieFactItemWidget(data: item);
        }).toList(),
      ),
    );
  }
}

class MovieFactItemWidget extends StatelessWidget {
  final MovieFact data;

  const MovieFactItemWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            data.title,
            style: TextStyleTheme.mainBold,
          ),
          const SizedBox(height: 3.0),
          Text(
            data.description,
            style: TextStyleTheme.main,
          ),
        ],
      ),
    );
  }
}
