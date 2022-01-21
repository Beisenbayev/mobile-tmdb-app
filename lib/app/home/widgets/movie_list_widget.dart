import 'package:flutter/material.dart';
import 'package:moovee_land/client_api/entity/movie.dart';
import 'package:moovee_land/core/consts/padding_consts.dart';
import 'package:moovee_land/core/models/movies_list_model.dart';
import 'package:moovee_land/core/theme/text_theme.dart';
import 'package:moovee_land/core/theme/widget_theme.dart';
import 'package:moovee_land/core/widgets/search_panel_widget.dart';
import 'package:moovee_land/router/routes.dart';

class MoviesListWidget extends StatelessWidget {
  const MoviesListWidget({Key? key}) : super(key: key);

  void handleCardTap(BuildContext context, int id) {
    Navigator.of(context).pushNamed(RouteAliasData.movieInfo, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    final _model = MoviesListProvider.of(context)!.model;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: PaddingConsts.screenVertical,
        horizontal: PaddingConsts.screenHorizontal,
      ),
      child: Column(
        children: [
          SearchPanelWidget(searchHandler: (String text) {}),
          const SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              itemCount: _model.movies.length,
              itemExtent: 170,
              itemBuilder: (BuildContext context, int index) {
                final movie = _model.movies[index];
                _model.loadMoviesByIndex(index);

                return MovieCardWidget(
                  movie: movie,
                  handleCardTap: (int id) => handleCardTap(context, id),
                  imageName: (String? path) => _model.getImageName(path),
                  parseDate: (DateTime? date) => _model.parseDateTime(date),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MovieCardWidget extends StatelessWidget {
  final Movie movie;
  final void Function(int) handleCardTap;
  final String Function(String?) imageName;
  final String Function(DateTime?) parseDate;

  const MovieCardWidget({
    Key? key,
    required this.movie,
    required this.handleCardTap,
    required this.imageName,
    required this.parseDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      clipBehavior: Clip.hardEdge,
      decoration: WidgetThemeShelf.roundedCardTheme,
      child: Stack(
        children: <Widget>[
          Row(
            children: <Widget>[
              Image.network(
                imageName(movie.posterPath),
                height: double.infinity,
                width: 100,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      movie.title,
                      style: TextThemeShelf.itemTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      parseDate(movie.releaseDate),
                      style: TextThemeShelf.subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      movie.overview,
                      style: TextThemeShelf.main,
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
              onTap: () => handleCardTap(movie.id),
            ),
          )
        ],
      ),
    );
  }
}
