import 'package:flutter/material.dart';
import 'package:moovee_land/client_api/entities/movie/movie.dart';
import 'package:moovee_land/client_api/entities/show/show.dart';
import 'package:moovee_land/core/consts/padding_consts.dart';
import 'package:moovee_land/core/models/model_utils.dart';
import 'package:moovee_land/core/models/news_feed_model.dart';
import 'package:moovee_land/core/theme/colors_theme.dart';
import 'package:moovee_land/core/theme/text_theme.dart';
import 'package:moovee_land/core/widgets/radial_percent_widget.dart';
import 'package:moovee_land/core/widgets/selector_panel_widget.dart';
import 'package:moovee_land/router/routes.dart';
import 'package:provider/provider.dart';

class NewsFeedWidget extends StatelessWidget {
  const NewsFeedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _model = Provider.of<NewsFeedModel>(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        vertical: PaddingConsts.screenVertical,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _MoviesScrollerWidget<Movie>(
            title: 'Movies',
            movies: _model.movies,
            moviesType: _model.moviesTypes,
            changeMoviesType: _model.handleChangeMoviesType,
          ),
          const SizedBox(height: 16),
          _MoviesScrollerWidget<Show>(
            title: 'Shows',
            movies: _model.shows,
            moviesType: _model.showsTypes,
            changeMoviesType: _model.handleChangeShowsType,
          ),
          const SizedBox(height: 16),
          _MoviesScrollerWidget<Movie>(
            title: 'Trending',
            movies: _model.movies,
            moviesType: _model.trandingTypes,
            changeMoviesType: _model.handleChangeMoviesType,
          ),
        ],
      ),
    );
  }
}

class _MoviesScrollerWidget<T> extends StatefulWidget {
  final String title;
  final List<T> movies;
  final List<String> moviesType;
  final void Function(String) changeMoviesType;

  const _MoviesScrollerWidget({
    Key? key,
    required this.title,
    required this.movies,
    required this.moviesType,
    required this.changeMoviesType,
  }) : super(key: key);

  @override
  State<_MoviesScrollerWidget> createState() => _MoviesScrollerWidgetState<T>();
}

class _MoviesScrollerWidgetState<T> extends State<_MoviesScrollerWidget> {
  int _selectedIndex = 0;

  void _handleSelectItem(int index) {
    setState(() => _selectedIndex = index);
    widget.changeMoviesType(widget.moviesType[index]);
  }

  void _handleCardTap(int id) {
    Navigator.of(context).pushNamed(RouteAliasData.movieInfo, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: PaddingConsts.screenHorizontal,
              ),
              child: Text(widget.title, style: TextThemeShelf.sectionTitle),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 370,
              child: ListView.builder(
                itemCount: widget.movies.length,
                itemExtent: 170.0,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final _movie = widget.movies[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ScrollMovieWidget<T>(
                      movie: _movie,
                      handleCardTap: _handleCardTap,
                    ),
                  );
                },
              ),
            )
          ],
        ),
        Positioned(
          top: 0,
          right: PaddingConsts.screenHorizontal,
          child: SelectorPanelWidget(
            items: widget.moviesType,
            selectedIndex: _selectedIndex,
            handleSelectItem: _handleSelectItem,
          ),
        ),
      ],
    );
  }
}

class ScrollMovieWidget<T> extends StatelessWidget {
  final T movie;
  final void Function(int) handleCardTap;

  const ScrollMovieWidget({
    Key? key,
    required this.movie,
    required this.handleCardTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? imageUrl;
    String title = '';
    double rating = 0;
    DateTime? releaseDate;
    int id = 0;

    switch (T) {
      case Movie:
        imageUrl = (movie as Movie).posterPath;
        title = (movie as Movie).title;
        rating = (movie as Movie).voteAverage * 10;
        releaseDate = (movie as Movie).releaseDate;
        id = (movie as Movie).id;
        break;
      case Show:
        imageUrl = (movie as Show).posterPath;
        title = (movie as Show).name;
        rating = (movie as Show).voteAverage * 10;
        releaseDate = (movie as Show).firstAirDate;
        id = (movie as Show).id;
        break;
    }

    final moviePoster = ModelUtils.getPosterImage(imageUrl);
    final movieDate = ModelUtils.parseDateTime(releaseDate, 'yMMMd');

    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 225,
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
          child: moviePoster,
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 203,
            right: 16,
            left: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 44,
                height: 44,
                child: RadialPercentWidget(
                  percent: rating,
                  activeLineColor: ColorThemeShelf.radialPercentActive,
                  freeLineColor: ColorThemeShelf.radialPercentFree,
                  fillColor: ColorThemeShelf.radialPercentFill,
                  lineWidth: 3,
                  textStyle: TextThemeShelf.smallBoldWhite,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: TextThemeShelf.mainBold,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                movieDate,
                style: TextThemeShelf.subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        Material(
          color: Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            onTap: () => handleCardTap(id),
          ),
        ),
      ],
    );
  }
}
