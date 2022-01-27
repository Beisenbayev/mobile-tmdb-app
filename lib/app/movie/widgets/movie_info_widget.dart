import 'package:flutter/material.dart';
import 'package:moovee_land/core/consts/padding_consts.dart';
import 'package:moovee_land/core/models/model_utils.dart';
import 'package:moovee_land/core/models/movie_page_model.dart';
import 'package:moovee_land/core/modules/members_data.dart';
import 'package:moovee_land/core/theme/colors_theme.dart';
import 'package:moovee_land/core/theme/text_theme.dart';
import 'package:moovee_land/core/widgets/radial_percent_widget.dart';

class MovieInfoWidget extends StatelessWidget {
  final members = MembersCollection.members;

  MovieInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: ColorThemeShelf.backgroundDark,
      child: Column(
        children: <Widget>[
          _TopPosterWidget(),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: PaddingConsts.screenHorizontal,
            ),
            child: Column(
              children: <Widget>[
                _TitleWidget(),
                const SizedBox(height: 16.0),
                _UserScoreWidget(),
                const SizedBox(height: 16.0),
                _GenreWidget(),
                const SizedBox(height: 20.0),
                _DescriptionWidget(),
                const SizedBox(height: 30.0),
                _MembersWidget(data: members),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TopPosterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _model = MoviePageProvider.of(context)!.model;
    final _ditails = _model.ditails!;
    final movieBackdrop = ModelUtils.getBackdropImage(_ditails.backdropPath);
    final moviePoster = ModelUtils.getPosterImage(_ditails.posterPath);

    return Stack(
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          height: 200,
          child: movieBackdrop,
        ),
        Container(
          width: double.infinity,
          height: 200.0,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                ColorThemeShelf.backgroundDark,
                Colors.transparent,
                Colors.transparent,
              ],
            ),
          ),
        ),
        Positioned(
          top: 20,
          left: PaddingConsts.screenHorizontal,
          bottom: 20,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
            ),
            clipBehavior: Clip.hardEdge,
            child: moviePoster,
          ),
        )
      ],
    );
  }
}

class _TitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _ditails = MoviePageProvider.of(context)!.model.ditails!;
    final _year = ModelUtils.parseDateTime(_ditails.releaseDate, 'y');

    return RichText(
      maxLines: 3,
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: _ditails.title,
            style: TextThemeShelf.itemTitleWhite,
          ),
          TextSpan(
            text: _year.isNotEmpty ? ' ($_year)' : '',
            style: TextThemeShelf.subtitle,
          ),
        ],
      ),
    );
  }
}

class _UserScoreWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _ditails = MoviePageProvider.of(context)!.model.ditails!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        TextButton(
          onPressed: () {},
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 55,
                height: 55,
                child: RadialPercentWidget(
                  percent: (_ditails.voteAverage * 10),
                  activeLineColor: ColorThemeShelf.radialPercentActive,
                  freeLineColor: ColorThemeShelf.radialPercentFree,
                  fillColor: ColorThemeShelf.radialPercentFill,
                  lineWidth: 3,
                  textStyle: TextThemeShelf.mainBoldWhite,
                ),
              ),
              const SizedBox(width: 6),
              const Text(
                'User Score',
                style: TextThemeShelf.mainBoldWhite,
              )
            ],
          ),
        ),
        Container(
          width: 1,
          height: 24,
          color: Colors.white.withOpacity(0.3),
        ),
        TextButton(
          onPressed: () {},
          child: Row(
            children: const <Widget>[
              Icon(
                Icons.play_arrow,
                color: Colors.white,
              ),
              SizedBox(width: 6),
              Text(
                'Play Trailer',
                style: TextThemeShelf.mainWhite,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _GenreWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String _info = '';
    final _ditails = MoviePageProvider.of(context)!.model.ditails!;
    final _date = ModelUtils.parseDateTime(_ditails.releaseDate, 'yMd');
    if (_date.isNotEmpty) _info = _date;
    final _country = _ditails.productionCountries.isNotEmpty
        ? _ditails.productionCountries[0].iso
        : '';
    if (_country.replaceAll(' ', '').isNotEmpty) _info = '$_info ($_country)';
    final _hours = ModelUtils.getHoursFromMinute(_ditails.runtime);
    if (_hours.replaceAll(' ', '').isNotEmpty) _info = '$_info • $_hours';
    final _genres =
        _ditails.genres.map((ganre) => ganre.name).toList().join(', ');
    if (_genres.isNotEmpty) _info = '$_info • $_genres';

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: ColorThemeShelf.backgroundDarker,
        border: Border.symmetric(
          horizontal: BorderSide(
            color: Colors.black.withOpacity(0.4),
            width: 1,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            _info,
            style: TextThemeShelf.mainWhite,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

class _DescriptionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _ditails = MoviePageProvider.of(context)!.model.ditails!;
    final tagline = (_ditails.tagline != null && _ditails.tagline!.isNotEmpty)
        ? Column(
            children: [
              Text(_ditails.tagline!, style: TextThemeShelf.subtitleCursive),
              const SizedBox(height: 12.0)
            ],
          )
        : const SizedBox.shrink();

    final overview =
        (_ditails.overview != null && _ditails.overview!.isNotEmpty)
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Overview', style: TextThemeShelf.itemTitleWhite),
                  const SizedBox(height: 10.0),
                  Text(_ditails.overview!, style: TextThemeShelf.mainWhite),
                ],
              )
            : const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        tagline,
        overview,
      ],
    );
  }
}

class _MembersWidget extends StatelessWidget {
  final List<Member> data;

  const _MembersWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        children: data
            .map(
              (item) => _MemberProfileWidget(
                fullName: item.fullName,
                position: item.position,
              ),
            )
            .toList(),
      ),
    );
  }
}

class _MemberProfileWidget extends StatelessWidget {
  final String fullName;
  final String position;

  const _MemberProfileWidget({
    required this.fullName,
    required this.position,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            fullName,
            style: TextThemeShelf.mainBoldWhite,
          ),
          const SizedBox(height: 3),
          Text(
            position,
            style: TextThemeShelf.subtitle,
          ),
        ],
      ),
    );
  }
}
