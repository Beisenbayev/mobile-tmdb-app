import 'package:flutter/material.dart';
import 'package:moovee_land/client_api/entities/movie/movie.dart';
import 'package:moovee_land/core/models/model_utils.dart';
import 'package:moovee_land/core/models/movie_page_model.dart';
import 'package:moovee_land/core/theme/text_theme.dart';
import 'package:moovee_land/core/theme/widget_theme.dart';
import 'package:moovee_land/router/routes.dart';
import 'package:provider/provider.dart';

class MovieSimilarWidget extends StatelessWidget {
  const MovieSimilarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _similarMovies = Provider.of<MoviePageModel>(context).similarMovies;

    if (_similarMovies == null || _similarMovies.movies.isEmpty) {
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
        'Similar Movies',
        style: TextThemeShelf.itemTitle,
      ),
    );
  }
}

class _HorizontalScrollMoviesWidget extends StatelessWidget {
  const _HorizontalScrollMoviesWidget({Key? key}) : super(key: key);

  void _handleCardTap(BuildContext context, int id) {
    Navigator.of(context).pushReplacementNamed(
      RouteAliasData.movieInfo,
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    final _movies = Provider.of<MoviePageModel>(context).similarMovies!.movies;

    return SizedBox(
      height: 180.0,
      child: ListView.builder(
        itemCount: _movies.length,
        itemExtent: 250.0,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          final _similarMovie = _movies[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: SimilarMovieCardWidget(
              movie: _similarMovie,
              handleTap: (int id) => _handleCardTap(context, id),
            ),
          );
        },
      ),
    );
  }
}

class SimilarMovieCardWidget extends StatelessWidget {
  final Movie movie;
  final void Function(int) handleTap;

  const SimilarMovieCardWidget({
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
