import 'package:flutter/material.dart';
import 'package:moovee_land/client_api/entity/movie.dart';
import 'package:moovee_land/core/consts/padding_consts.dart';
import 'package:moovee_land/core/models/news_feed_model.dart';
import 'package:moovee_land/core/theme/colors_theme.dart';
import 'package:moovee_land/core/theme/text_theme.dart';
import 'package:moovee_land/core/widgets/radial_percent_widget.dart';
import 'package:moovee_land/core/widgets/selector_panel_widget.dart';
import 'package:moovee_land/router/routes.dart';

class NewsFeedWidget extends StatelessWidget {
  const NewsFeedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _model = NewsFeedProvider.of(context)!.model;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        vertical: PaddingConsts.screenVertical,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _MoviesScrollerWidget(
            title: 'Movies',
            movies: _model.movies,
            moviesType: _model.moviesTypes,
            changeMoviesType: _model.handleChangeMoviesType,
          ),
          const SizedBox(height: 16),
          _MoviesScrollerWidget(
            title: 'Shows',
            movies: _model.movies,
            moviesType: _model.showsTypes,
            changeMoviesType: _model.handleChangeMoviesType,
          ),
          const SizedBox(height: 16),
          _MoviesScrollerWidget(
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

class _MoviesScrollerWidget extends StatefulWidget {
  final String title;
  final List<Movie> movies;
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
  State<_MoviesScrollerWidget> createState() => _MoviesScrollerWidgetState();
}

class _MoviesScrollerWidgetState extends State<_MoviesScrollerWidget> {
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
    final _model = NewsFeedProvider.of(context)!.model;

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
                    child: ScrollMovieWidget(
                      movie: _movie,
                      imageName: (String? path) => _model.getImageName(path),
                      parseDate: (DateTime? date) => _model.parseDateTime(date),
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

class ScrollMovieWidget extends StatelessWidget {
  final Movie movie;
  final String Function(String?) imageName;
  final String Function(DateTime?) parseDate;
  final void Function(int) handleCardTap;

  const ScrollMovieWidget({
    Key? key,
    required this.movie,
    required this.imageName,
    required this.parseDate,
    required this.handleCardTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 225,
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
          child: Image.network(
            imageName(movie.posterPath),
            fit: BoxFit.cover,
          ),
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
                  percent: movie.voteAverage,
                  activeLineColor: ColorThemeShelf.radialPercentActive,
                  freeLineColor: ColorThemeShelf.radialPercentFree,
                  fillColor: ColorThemeShelf.radialPercentFill,
                  lineWidth: 3,
                  textStyle: TextThemeShelf.mainBoldWhite,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                movie.title,
                style: TextThemeShelf.mainBold,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                parseDate(movie.releaseDate),
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
            onTap: () => handleCardTap(movie.id),
          ),
        ),
      ],
    );
  }
}
