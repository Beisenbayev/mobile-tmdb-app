import 'package:flutter/material.dart';
import 'package:moovee_land/core/modules/movie_keywords_data.dart';
import 'package:moovee_land/core/theme/button_theme.dart';
import 'package:moovee_land/core/theme/text_theme.dart';

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _TitleWidget(),
          const SizedBox(height: 8),
          _KeywordButtonsWidget(keywords: _keywords),
        ],
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text(
      'Keywords',
      style: TextThemeShelf.itemTitle,
    );
  }
}

class _KeywordButtonsWidget extends StatelessWidget {
  final List<Keyword> keywords;

  const _KeywordButtonsWidget({
    Key? key,
    required this.keywords,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5.0,
      runSpacing: 5.0,
      children: keywords.map((item) {
        return MovieKeywordButtonWidget(data: item);
      }).toList(),
    );
  }
}

class MovieKeywordButtonWidget extends StatelessWidget {
  final Keyword data;
  const MovieKeywordButtonWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: ButtonThemeShelf.outlinedGrayButton,
      child: Text(data.title),
    );
  }
}
