import 'package:flutter/material.dart';
import 'package:moovee_land/core/modules/actors_data.dart';
import 'package:moovee_land/core/theme/text_theme.dart';

class MovieActorsWidget extends StatelessWidget {
  final List<Actor> _actors = ActorsCollection.actors;
  MovieActorsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Top Billed Cast',
              style: TextStyleTheme.itemTitle,
            ),
          ),
          const SizedBox(height: 16.0),
          SizedBox(
            height: 240,
            child: ListView.builder(
              itemCount: _actors.length,
              itemExtent: 130.0,
              padding: const EdgeInsets.only(left: 10.0, right: 5.0),
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
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Full Cast & Crew',
                style: TextStyleTheme.itemTitle,
              ),
            ),
          )
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
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 5,
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              const Image(
                image: AssetImage('assets/images/actorImage.jpg'),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.fullName,
                      style: TextStyleTheme.mainBold,
                    ),
                    const SizedBox(height: 3),
                    Text(
                      data.character,
                      style: TextStyleTheme.main,
                    ),
                    if (data.episodeCount is int) ...[
                      const SizedBox(height: 3),
                      Text(
                        '${data.episodeCount} episodes',
                        style: TextStyleTheme.subtitle,
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
