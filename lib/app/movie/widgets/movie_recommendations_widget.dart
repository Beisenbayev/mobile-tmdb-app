import 'package:flutter/material.dart';
import 'package:moovee_land/core/modules/recommended_movies_data.dart';
import 'package:moovee_land/core/theme/text_theme.dart';
import 'package:moovee_land/core/theme/widget_theme.dart';

class MovieRecommendationsWidget extends StatelessWidget {
  final List<RecommendedMovie> _recommendedMovies =
      RecommendedMoviesCollection.recommendedMovies;

  MovieRecommendationsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _TitleWidget(),
          const SizedBox(height: 16.0),
          _HorizontalScrollMoviesWidget(
            recommendedMovies: _recommendedMovies,
          )
        ],
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        'Recommendations',
        style: TextThemeShelf.itemTitle,
      ),
    );
  }
}

class _HorizontalScrollMoviesWidget extends StatelessWidget {
  final List<RecommendedMovie> recommendedMovies;

  const _HorizontalScrollMoviesWidget({
    Key? key,
    required this.recommendedMovies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 175.0,
      child: ListView.builder(
        itemCount: recommendedMovies.length,
        itemExtent: 250.0,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          final recommendedMovie = recommendedMovies[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: RecommendedMovieCardWidget(
              data: recommendedMovie,
            ),
          );
        },
      ),
    );
  }
}

class RecommendedMovieCardWidget extends StatelessWidget {
  final RecommendedMovie data;

  const RecommendedMovieCardWidget({
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
              Image(image: AssetImage(data.imageName)),
              const SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        data.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextThemeShelf.main,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${data.userScore}%',
                      style: TextThemeShelf.main,
                    ),
                  ],
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
