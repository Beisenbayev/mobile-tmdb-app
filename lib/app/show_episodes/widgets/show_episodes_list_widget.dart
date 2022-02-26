import 'package:flutter/material.dart';
import 'package:moovee_land/client_api/entities/season/season_details.dart';
import 'package:moovee_land/core/consts/padding_consts.dart';
import 'package:moovee_land/core/models/show_episodes_model.dart';
import 'package:moovee_land/core/models/utils/model_utils.dart';
import 'package:moovee_land/core/theme/text_theme.dart';
import 'package:moovee_land/core/theme/widget_theme.dart';
import 'package:provider/provider.dart';

class ShowEpisodesListWidget extends StatelessWidget {
  const ShowEpisodesListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _episodes = context
        .select((ShowEpisodesModel model) => model.seasonDetails!.episodes);

    return Padding(
      padding: const EdgeInsets.symmetric(
        //vertical: PaddingConsts.screenVertical,
        horizontal: PaddingConsts.screenHorizontal,
      ),
      child: ListView.builder(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        itemCount: _episodes.length,
        itemExtent: 170,
        itemBuilder: (BuildContext context, int index) {
          return _EpisodeItemWidget(
            episode: _episodes[index],
          );
        },
      ),
    );
  }
}

class _EpisodeItemWidget extends StatelessWidget {
  final Episode episode;

  const _EpisodeItemWidget({
    Key? key,
    required this.episode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _poster = ModelUtils.getPosterImage(episode.stillPath);
    final _date = ModelUtils.parseDateTime(episode.airDate, 'yMMMMd');

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
                        'Episode ${episode.episodeNumber}',
                        style: TextThemeShelf.itemTitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 3),
                      Text(
                        episode.name,
                        style: TextThemeShelf.mainBold,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: Text(
                          episode.overview,
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
        ],
      ),
    );
  }
}
