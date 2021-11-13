import 'package:flutter/material.dart';
import 'package:moovee_land/modules/movie_data.dart';
import 'package:moovee_land/theme/text_theme.dart';

class MovieListWidget extends StatelessWidget {
  MovieListWidget({Key? key}) : super(key: key);

  final _movies = MoviesData.movies;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      itemCount: _movies.length,
      itemExtent: 170,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: MovieCardWidget(),
        );
      },
    );
  }
}

class MovieCardWidget extends StatelessWidget {
  const MovieCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: <Widget>[
          Row(
            children: <Widget>[
              const Image(
                image: AssetImage('assets/images/image.jpg'),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text(
                      'Parasite',
                      style: TextStyleTheme.itemTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      'July 20, 2001',
                      style: TextStyleTheme.subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'All unemployed, Ki-taek\'s family takes peculiar interest in the wealthy and glamorous Parks for their livelihood until they get entangled in an unexpected incident.',
                      style: TextStyleTheme.main,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 5),
            ],
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                print('ok');
              },
            ),
          )
        ],
      ),
    );
  }
}
