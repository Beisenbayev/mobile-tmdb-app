import 'package:flutter/material.dart';
import 'package:moovee_land/core/consts/padding_consts.dart';
import 'package:moovee_land/core/models/utils/model_utils.dart';
import 'package:moovee_land/core/models/show_page_model.dart';
import 'package:moovee_land/core/theme/text_theme.dart';
import 'package:moovee_land/core/theme/widget_theme.dart';
import 'package:provider/provider.dart';

class ShowSeasonsWidget extends StatelessWidget {
  const ShowSeasonsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _seasons =
        context.select((ShowPageModel model) => model.ditails!.seasons);

    if (_seasons.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 6,
        horizontal: PaddingConsts.screenHorizontal,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          _TitleWidget(),
          SizedBox(height: 4.0),
          _SeasonCardWidget(),
          SizedBox(height: 14),
        ],
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Current season',
          style: TextThemeShelf.itemTitle,
        ),
        TextButton(
          onPressed: () {},
          child: const Text('All'),
        )
      ],
    );
  }
}

class _SeasonCardWidget extends StatelessWidget {
  const _SeasonCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _season =
        context.select((ShowPageModel model) => model.ditails!.seasons.last);
    final _year = ModelUtils.parseDateTime(_season.airDate, 'y');
    final _date = ModelUtils.parseDateTime(_season.airDate, 'yMMMMd');
    final _subtitle = '$_year | ${_season.episodeCount} episodes';

    return Container(
      width: double.infinity,
      height: 130.0,
      clipBehavior: Clip.hardEdge,
      decoration: WidgetThemeShelf.roundedCardTheme,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _season.name,
                  style: TextThemeShelf.itemTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 3),
                Text(
                  _subtitle,
                  style: TextThemeShelf.mainBold,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 30),
                Text(
                  _date,
                  style: TextThemeShelf.subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
