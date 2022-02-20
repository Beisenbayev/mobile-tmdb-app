import 'package:flutter/material.dart';
import 'package:moovee_land/core/consts/padding_consts.dart';
import 'package:moovee_land/core/models/utils/model_utils.dart';
import 'package:moovee_land/core/models/movie_page_model.dart';
import 'package:moovee_land/core/theme/text_theme.dart';
import 'package:provider/provider.dart';

class MovieFactsWidget extends StatelessWidget {
  const MovieFactsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _details = context.select((MoviePageModel model) => model.details!);
    final _budget = ModelUtils.getCashFormatFromInt(_details.budget);
    final _revenue = ModelUtils.getCashFormatFromInt(_details.revenue);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: PaddingConsts.screenHorizontal,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MovieFactItemWidget(
            title: 'Status',
            description: _details.status,
          ),
          MovieFactItemWidget(
            title: 'Original Language',
            description: _details.originalLanguage.toUpperCase(),
          ),
          MovieFactItemWidget(
            title: 'Budget',
            description: _budget,
          ),
          MovieFactItemWidget(
            title: 'Revenue',
            description: _revenue,
          ),
        ],
      ),
    );
  }
}

class MovieFactItemWidget extends StatelessWidget {
  final String title;
  final String description;

  const MovieFactItemWidget({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextThemeShelf.mainBold,
          ),
          const SizedBox(height: 3.0),
          Text(
            description,
            style: TextThemeShelf.main,
          ),
        ],
      ),
    );
  }
}
