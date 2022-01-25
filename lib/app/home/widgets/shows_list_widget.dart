import 'package:flutter/material.dart';
import 'package:moovee_land/client_api/entity/show.dart';
import 'package:moovee_land/core/consts/padding_consts.dart';
import 'package:moovee_land/core/models/shows_list_model.dart';
import 'package:moovee_land/core/theme/text_theme.dart';
import 'package:moovee_land/core/theme/widget_theme.dart';
import 'package:moovee_land/core/widgets/search_panel_widget.dart';
import 'package:moovee_land/router/routes.dart';

class ShowsListWidget extends StatelessWidget {
  const ShowsListWidget({Key? key}) : super(key: key);

  void handleCardTap(BuildContext context, int id) {
    Navigator.of(context).pushNamed(RouteAliasData.movieInfo, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    final _model = ShowsListProvider.of(context)!.model;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: PaddingConsts.screenVertical,
        horizontal: PaddingConsts.screenHorizontal,
      ),
      child: Column(
        children: [
          SearchPanelWidget(searchHandler: _model.handleSearchShows),
          const SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              itemCount: _model.shows.length,
              itemExtent: 170,
              itemBuilder: (BuildContext context, int index) {
                final _show = _model.shows[index];
                _model.loadShowsByIndex(index);

                return ShowCardWidget(
                  show: _show,
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

class ShowCardWidget extends StatelessWidget {
  final Show show;
  final void Function(int) handleCardTap;
  final String Function(String?) imageName;
  final String Function(DateTime?) parseDate;

  const ShowCardWidget({
    Key? key,
    required this.show,
    required this.handleCardTap,
    required this.imageName,
    required this.parseDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviePoster = (show.posterPath != null)
        ? Image.network(imageName(show.posterPath), fit: BoxFit.cover)
        : Image.asset('assets/images/film-poster.png', fit: BoxFit.cover);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      clipBehavior: Clip.hardEdge,
      decoration: WidgetThemeShelf.roundedCardTheme,
      child: Stack(
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(
                width: 100,
                height: double.infinity,
                child: moviePoster,
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      show.name,
                      style: TextThemeShelf.itemTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      parseDate(show.firstAirDate),
                      style: TextThemeShelf.subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      show.overview,
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
              onTap: () => handleCardTap(show.id),
            ),
          )
        ],
      ),
    );
  }
}