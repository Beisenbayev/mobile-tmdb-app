import 'package:flutter/material.dart';
import 'package:moovee_land/core/consts/padding_consts.dart';
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
    final movieBackdrop = (_ditails.posterPath != null)
        ? Image.network(_model.getImageName(_ditails.backdropPath),
            fit: BoxFit.cover)
        : Image.asset('assets/images/film-poster.png', fit: BoxFit.cover);
    final moviePoster = (_ditails.posterPath != null)
        ? Image.network(_model.getImageName(_ditails.posterPath),
            fit: BoxFit.cover)
        : Image.asset('assets/images/film-poster.png', fit: BoxFit.cover);

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
    return RichText(
      maxLines: 3,
      textAlign: TextAlign.center,
      text: const TextSpan(
        children: [
          TextSpan(
            text: 'Shang-Chi and the Legend of the Ten Rings ',
            style: TextThemeShelf.itemTitleWhite,
          ),
          TextSpan(
            text: '(2021)',
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        TextButton(
          onPressed: () {},
          child: Row(
            children: const <Widget>[
              SizedBox(
                width: 55,
                height: 55,
                child: RadialPercentWidget(
                  percent: 79,
                  activeLineColor: ColorThemeShelf.radialPercentActive,
                  freeLineColor: ColorThemeShelf.radialPercentFree,
                  fillColor: ColorThemeShelf.radialPercentFill,
                  lineWidth: 3,
                  textStyle: TextThemeShelf.mainBoldWhite,
                ),
              ),
              SizedBox(width: 6),
              Text(
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
        children: const <Widget>[
          Text(
            '09/02/2021 (KZ) • 2h 12m',
            style: TextThemeShelf.mainWhite,
          ),
          Text(
            'Action, Adventure, Fantasy',
            style: TextThemeShelf.mainWhite,
          ),
        ],
      ),
    );
  }
}

class _DescriptionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const <Widget>[
        Text(
          'You can\'t outrun your destiny.',
          style: TextThemeShelf.subtitleCursive,
        ),
        SizedBox(height: 12.0),
        Text(
          'Overview',
          style: TextThemeShelf.itemTitleWhite,
        ),
        SizedBox(height: 10.0),
        Text(
          'Shang-Chi must confront the past he thought he left behind when he is drawn into the web of the mysterious Ten Rings organization.',
          style: TextThemeShelf.mainWhite,
        ),
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
