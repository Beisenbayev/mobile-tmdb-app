import 'package:flutter/material.dart';
import 'package:moovee_land/client_api/entities/show/show.dart';
import 'package:moovee_land/core/models/utils/model_utils.dart';
import 'package:moovee_land/core/models/show_page_model.dart';
import 'package:moovee_land/core/theme/text_theme.dart';
import 'package:moovee_land/core/theme/widget_theme.dart';
import 'package:moovee_land/router/navigation_controller.dart';
import 'package:provider/provider.dart';

class ShowSimilarWidget extends StatelessWidget {
  const ShowSimilarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _similarShows =
        context.select((ShowPageModel model) => model.similarShows);

    if (_similarShows == null || _similarShows.shows.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          _TitleWidget(),
          SizedBox(height: 16.0),
          _HorizontalScrollShowsWidget(),
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
        'Similar Shows',
        style: TextThemeShelf.itemTitle,
      ),
    );
  }
}

class _HorizontalScrollShowsWidget extends StatelessWidget {
  const _HorizontalScrollShowsWidget({Key? key}) : super(key: key);

  void _handleCardTap(BuildContext context, int id) {
    NavigationController.replaceShowPage(context, id);
  }

  @override
  Widget build(BuildContext context) {
    final _shows =
        context.select((ShowPageModel model) => model.similarShows!.shows);

    return SizedBox(
      height: 180.0,
      child: ListView.builder(
        itemCount: _shows.length,
        itemExtent: 250.0,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          final _similarShow = _shows[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: _SimilarShowCardWidget(
              show: _similarShow,
              handleTap: (int id) => _handleCardTap(context, id),
            ),
          );
        },
      ),
    );
  }
}

class _SimilarShowCardWidget extends StatelessWidget {
  final Show show;
  final void Function(int) handleTap;

  const _SimilarShowCardWidget({
    Key? key,
    required this.show,
    required this.handleTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final showBackdrop = ModelUtils.getBackdropImage(show.backdropPath);

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
                child: showBackdrop,
              ),
              const SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        show.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextThemeShelf.main,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${(show.voteAverage * 10).toInt()}%',
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
              onTap: () => handleTap(show.id),
            ),
          ),
        ],
      ),
    );
  }
}
