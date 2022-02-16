import 'package:flutter/material.dart';
import 'package:moovee_land/client_api/entities/movie/movie.dart';
import 'package:moovee_land/core/models/utils/model_utils.dart';
import 'package:moovee_land/core/models/movie_page_model.dart';
import 'package:moovee_land/core/theme/text_theme.dart';
import 'package:moovee_land/core/theme/widget_theme.dart';
import 'package:moovee_land/router/navigation_controller.dart';
import 'package:provider/provider.dart';

class MovieRecommendationsWidget extends StatelessWidget {
  const MovieRecommendationsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _recommendations =
        Provider.of<MoviePageModel>(context).recommendations;

    if (_recommendations == null || _recommendations.movies.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          _TitleWidget(),
          SizedBox(height: 16.0),
          _HorizontalScrollMoviesWidget(),
        ],
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({
    Key? key,
  }) : super(key: key);

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
  const _HorizontalScrollMoviesWidget({Key? key}) : super(key: key);

  void _handleCardTap(BuildContext context, int id) {
    NavigationController.replaceMoviePage(context, id);
  }

  @override
  Widget build(BuildContext context) {
    final _movies =
        Provider.of<MoviePageModel>(context).recommendations!.movies;

    return SizedBox(
      height: 180.0,
      child: ListView.builder(
        itemCount: _movies.length,
        itemExtent: 250.0,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          final _recommendedMovie = _movies[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: RecommendedMovieCardWidget(
              movie: _recommendedMovie,
              handleTap: (int id) => _handleCardTap(context, id),
            ),
          );
        },
      ),
    );
  }
}

class RecommendedMovieCardWidget extends StatelessWidget {
  final Movie movie;
  final void Function(int) handleTap;

  const RecommendedMovieCardWidget({
    Key? key,
    required this.movie,
    required this.handleTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movieBackdrop = ModelUtils.getBackdropImage(movie.backdropPath);

    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: WidgetThemeShelf.roundedCardTheme,
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 140,
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                child: movieBackdrop,
              ),
              const SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        movie.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextThemeShelf.main,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${(movie.voteAverage * 10).toInt()}%',
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
              onTap: () => handleTap(movie.id),
            ),
          ),
        ],
      ),
    );
  }
}
