import 'package:flutter/material.dart';
import 'package:moovee_land/core/consts/padding_consts.dart';
import 'package:moovee_land/core/modules/movie_facts_data.dart';
import 'package:moovee_land/core/theme/text_theme.dart';

class MovieFactsWidget extends StatelessWidget {
  final List<MovieFact> _movieFacts = MovieFactsCollections.movieFacts;

  MovieFactsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: PaddingConsts.screenHorizontal,
      ),
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
            style: TextThemeShelf.mainBold,
          ),
          const SizedBox(height: 3.0),
          Text(
            data.description,
            style: TextThemeShelf.main,
          ),
        ],
      ),
    );
  }
}
