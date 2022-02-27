import 'package:flutter/material.dart';
import 'package:moovee_land/client_api/entities/episode/episode_credits.dart';
import 'package:moovee_land/core/consts/padding_consts.dart';
import 'package:moovee_land/core/models/episode_page_model.dart';
import 'package:moovee_land/core/models/utils/model_utils.dart';
import 'package:moovee_land/core/theme/text_theme.dart';
import 'package:moovee_land/core/theme/widget_theme.dart';
import 'package:provider/provider.dart';

class EpisodeActorsWidget extends StatelessWidget {
  const EpisodeActorsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _credits =
        context.select((EpisodePageModel model) => model.episodeCredits);

    if (_credits == null || _credits.cast.isEmpty) {
      return const SizedBox.shrink();
    }
    final _actors = (_credits.cast.length > 15)
        ? _credits.cast.sublist(0, 15)
        : _credits.cast;

    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: PaddingConsts.screenHorizontal,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Cast',
                  style: TextThemeShelf.itemTitle,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('All'),
                )
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          SizedBox(
            height: 240,
            child: ListView.builder(
              itemCount: _actors.length,
              itemExtent: 130.0,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: _ActorCardWidget(
                    cast: _actors[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ActorCardWidget extends StatelessWidget {
  final Cast cast;
  const _ActorCardWidget({
    Key? key,
    required this.cast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _avatar = ModelUtils.getActorImage(cast.profilePath);

    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: WidgetThemeShelf.roundedCardTheme,
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                height: 135,
                child: _avatar,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cast.originalName,
                      style: TextThemeShelf.mainBold,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 3),
                    Text(
                      cast.character,
                      style: TextThemeShelf.main,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              )
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
