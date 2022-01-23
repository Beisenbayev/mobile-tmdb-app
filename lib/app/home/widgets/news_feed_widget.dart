import 'package:flutter/material.dart';
import 'package:moovee_land/core/consts/padding_consts.dart';
import 'package:moovee_land/core/models/news_feed_model.dart';
import 'package:moovee_land/core/theme/colors_theme.dart';
import 'package:moovee_land/core/theme/text_theme.dart';
import 'package:moovee_land/core/widgets/radial_percent_widget.dart';
import 'package:moovee_land/core/widgets/selector_panel_widget.dart';

class NewsFeedWidget extends StatelessWidget {
  const NewsFeedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        vertical: PaddingConsts.screenVertical,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          _MoviesScrollerWidget(
            title: 'Movies',
            moviesType: ['Latest', 'Popular', 'Top Rated', 'Upcoming'],
          ),
          SizedBox(height: 16),
          _MoviesScrollerWidget(
            title: 'Shows',
            moviesType: ['Latest', 'Popular', 'Top Rated', 'Upcoming'],
          ),
          SizedBox(height: 16),
          _MoviesScrollerWidget(
            title: 'Trending',
            moviesType: ['Today', 'Week'],
          ),
        ],
      ),
    );
  }
}

class _MoviesScrollerWidget extends StatefulWidget {
  final String title;
  final List<String> moviesType;

  const _MoviesScrollerWidget({
    Key? key,
    required this.title,
    required this.moviesType,
  }) : super(key: key);

  @override
  State<_MoviesScrollerWidget> createState() => _MoviesScrollerWidgetState();
}

class _MoviesScrollerWidgetState extends State<_MoviesScrollerWidget> {
  int _selectedIndex = 0;

  void _handleSelectItem(int index) {
    setState(() => _selectedIndex = index);
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
                itemCount: 20,
                itemExtent: 170.0,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final _movie = MovieFake();

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ScrollMovieWidget(
                      movie: _movie,
                      imageName: (String? path) => _model.getImageName(path),
                      parseDate: (DateTime? date) => _model.parseDateTime(date),
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
  final MovieFake movie;
  final String Function(String?) imageName;
  final String Function(DateTime?) parseDate;

  const ScrollMovieWidget({
    Key? key,
    required this.movie,
    required this.imageName,
    required this.parseDate,
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
            imageName(movie.image),
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
                  percent: movie.rating,
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
                parseDate(movie.date),
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
            onTap: () {},
          ),
        ),
      ],
    );
  }
}

class MovieFake {
  final String title = 'Harry Potter 20th Anniversary: Return to Hogwarts';
  final DateTime date = DateTime.now();
  final double rating = 99;
  final String image = '/k2twTjSddgLc1oFFHVibfxp2kQV.jpg';
}
