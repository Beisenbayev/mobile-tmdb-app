import 'package:flutter/material.dart';
import 'package:moovee_land/modules/movie_keywords_data.dart';
import 'package:moovee_land/theme/button_theme.dart';

class MovieKeywordsWidget extends StatelessWidget {
  final List<Keyword> _keywords = KeywordsCollection.keywords;

  MovieKeywordsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color.fromRGBO(215, 215, 215, 1),
            width: 1,
          ),
        ),
      ),
      child: Wrap(
        spacing: 5.0,
        runSpacing: 5.0,
        children: _keywords.map((item) {
          return MovieKeywordChipWidget(data: item);
        }).toList(),
      ),
    );
  }
}

class MovieKeywordChipWidget extends StatelessWidget {
  final Keyword data;
  const MovieKeywordChipWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: ButtonStyleTheme.outlinedGrayButton,
      child: Text(data.title),
    );
  }
}
