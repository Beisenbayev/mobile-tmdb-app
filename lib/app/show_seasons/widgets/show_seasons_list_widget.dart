import 'package:flutter/material.dart';
import 'package:moovee_land/client_api/entities/show/show_details.dart';
import 'package:moovee_land/core/consts/padding_consts.dart';
import 'package:moovee_land/core/models/show_page_model.dart';
import 'package:moovee_land/core/models/utils/model_utils.dart';
import 'package:moovee_land/core/theme/text_theme.dart';
import 'package:moovee_land/core/theme/widget_theme.dart';
import 'package:provider/provider.dart';

class ShowSeasonsListWidget extends StatelessWidget {
  const ShowSeasonsListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _seasons =
        context.select((ShowPageModel model) => model.details!.seasons);

    return Padding(
      padding: const EdgeInsets.symmetric(
        //vertical: PaddingConsts.screenVertical,
        horizontal: PaddingConsts.screenHorizontal,
      ),
      child: ListView.builder(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        itemCount: _seasons.length,
        itemExtent: 170,
        itemBuilder: (BuildContext context, int index) {
          return _SeasonItemWidget(
            season: _seasons[index],
            //handleCardTap: (int id) => handleCardTap(context, id),
          );
        },
      ),
    );
  }
}

class _SeasonItemWidget extends StatelessWidget {
  final Season season;

  const _SeasonItemWidget({
    Key? key,
    required this.season,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _poster = ModelUtils.getPosterImage(season.posterPath);
    final _year = ModelUtils.parseDateTime(season.airDate, 'y');
    final _date = ModelUtils.parseDateTime(season.airDate, 'yMMMMd');
    final _subtitle = '$_year | ${season.episodeCount} episodes';

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10),
      clipBehavior: Clip.hardEdge,
      decoration: WidgetThemeShelf.roundedCardTheme,
      child: Stack(
        children: [
          Row(
            children: [
              SizedBox(
                width: 120,
                height: double.infinity,
                child: _poster,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        season.name,
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
                      const SizedBox(height: 10),
                      Expanded(
                        child: Text(
                          season.overview,
                          style: TextThemeShelf.main,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        _date,
                        style: TextThemeShelf.subtitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
              ),
            ],
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
