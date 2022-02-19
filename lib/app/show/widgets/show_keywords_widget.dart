import 'package:flutter/material.dart';
import 'package:moovee_land/client_api/entities/media/media_keywords.dart';
import 'package:moovee_land/core/consts/padding_consts.dart';
import 'package:moovee_land/core/models/show_page_model.dart';
import 'package:moovee_land/core/theme/button_theme.dart';
import 'package:moovee_land/core/theme/text_theme.dart';
import 'package:provider/provider.dart';

class ShowKeywordsWidget extends StatelessWidget {
  const ShowKeywordsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _keywordsResponse =
        context.select((ShowPageModel model) => model.keywordsResponse);

    if (_keywordsResponse == null || _keywordsResponse.keywords.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.all(PaddingConsts.screenHorizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          _TitleWidget(),
          SizedBox(height: 8),
          _KeywordButtonsWidget(),
        ],
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Keywords',
      style: TextThemeShelf.itemTitle,
    );
  }
}

class _KeywordButtonsWidget extends StatelessWidget {
  const _KeywordButtonsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _keywordsResponse =
        context.select((ShowPageModel model) => model.keywordsResponse!);

    return Wrap(
      spacing: 10.0,
      children: _keywordsResponse.keywords.map((item) {
        return ShowKeywordButtonWidget(keyword: item);
      }).toList(),
    );
  }
}

class ShowKeywordButtonWidget extends StatelessWidget {
  final Keyword keyword;

  const ShowKeywordButtonWidget({
    Key? key,
    required this.keyword,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: ButtonThemeShelf.outlinedGrayButton,
      child: Text(keyword.name),
    );
  }
}
