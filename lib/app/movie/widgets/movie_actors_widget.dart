import 'package:flutter/material.dart';
import 'package:moovee_land/core/consts/padding_consts.dart';
import 'package:moovee_land/core/modules/actors_data.dart';
import 'package:moovee_land/core/theme/text_theme.dart';
import 'package:moovee_land/core/theme/widget_theme.dart';

class MovieActorsWidget extends StatelessWidget {
  final List<Actor> _actors = ActorsCollection.actors;
  MovieActorsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  'Top Billed Cast',
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
                final actor = _actors[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: ActorCardWidget(
                    data: actor,
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

class ActorCardWidget extends StatelessWidget {
  final Actor data;
  const ActorCardWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: WidgetThemeShelf.roundedCardTheme,
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              const Image(
                width: double.infinity,
                height: 135,
                fit: BoxFit.cover,
                image: AssetImage('assets/images/actorImage.jpg'),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.fullName,
                      style: TextThemeShelf.mainBold,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 3),
                    Text(
                      data.character,
                      style: TextThemeShelf.main,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (data.episodeCount is int) ...[
                      const SizedBox(height: 3),
                      Text(
                        '${data.episodeCount} episodes',
                        style: TextThemeShelf.subtitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    ]
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
