import 'package:flutter/material.dart';
import 'package:moovee_land/core/consts/padding_consts.dart';
import 'package:moovee_land/core/models/show_episodes_model.dart';
import 'package:moovee_land/core/models/utils/model_utils.dart';
import 'package:moovee_land/core/models/show_page_model.dart';
import 'package:moovee_land/core/theme/text_theme.dart';
import 'package:moovee_land/core/theme/widget_theme.dart';
import 'package:moovee_land/router/navigation_controller.dart';
import 'package:provider/provider.dart';

class ShowSeasonsWidget extends StatelessWidget {
  const ShowSeasonsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _seasons =
        context.select((ShowPageModel model) => model.details!.seasons);

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

  void handleShowAllSeasons(BuildContext context, int id) {
    NavigationController.goToShowSeasonsPage(context, id);
  }

  @override
  Widget build(BuildContext context) {
    final _id = context.select((ShowPageModel model) => model.details!.id);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Current season',
          style: TextThemeShelf.itemTitle,
        ),
        TextButton(
          onPressed: () => handleShowAllSeasons(context, _id),
          child: const Text('All'),
        )
      ],
    );
  }
}

class _SeasonCardWidget extends StatelessWidget {
  const _SeasonCardWidget({Key? key}) : super(key: key);

  void handleShowEpisodes(BuildContext context, int showId, int seasonNumber) {
    NavigationController.goToShowEpisodesPage(
      context,
      ShowSeasonData(
        showId: showId,
        seasonNumber: seasonNumber,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _details = context.select((ShowPageModel model) => model.details!);
    final _season =
        context.select((ShowPageModel model) => model.details!.seasons.last);
    final _poster = ModelUtils.getPosterImage(_season.posterPath);
    final _year = ModelUtils.parseDateTime(_season.airDate, 'y');
    final _date = ModelUtils.parseDateTime(_season.airDate, 'yMMMMd');
    final _subtitle = '$_year | ${_season.episodeCount} episodes';

    return Container(
      width: double.infinity,
      height: 170.0,
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
                      const SizedBox(height: 10),
                      Expanded(
                        child: Text(
                          _season.overview,
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
              onTap: () => handleShowEpisodes(
                  context, _details.id, _season.seasonNumber),
            ),
          ),
        ],
      ),
    );
  }
}
