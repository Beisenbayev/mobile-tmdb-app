import 'package:flutter/material.dart';
import 'package:moovee_land/modules/members_data.dart';
import 'package:moovee_land/theme/colors_theme.dart';
import 'package:moovee_land/theme/text_theme.dart';
import 'package:moovee_land/widgets/radial_percent_widget.dart';

class MovieInfoWidget extends StatelessWidget {
  final members = MembersCollection.members;

  MovieInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _TopPosterWidget(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 16.0),
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
    );
  }
}

class _TopPosterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        const Image(
          height: 225.0,
          image: AssetImage('assets/images/topWallpaper.jpg'),
        ),
        Container(
          width: double.infinity,
          height: 225.0,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                ColorPaletteTheme.backgroundDark,
                Colors.transparent,
                Colors.transparent,
              ],
            ),
          ),
        ),
        Positioned(
          top: 16,
          left: 16,
          bottom: 16,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
            ),
            clipBehavior: Clip.hardEdge,
            child: const Image(
              image: AssetImage('assets/images/topSubimage.jpg'),
              fit: BoxFit.cover,
            ),
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
      text: const TextSpan(
        children: [
          TextSpan(
            text: 'Shang-Chi and the Legend of the Ten Rings ',
            style: TextStyleTheme.itemTitleWhite,
          ),
          TextSpan(
            text: '(2021)',
            style: TextStyleTheme.mainWhite,
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
                  activeLineColor: ColorPaletteTheme.radialPercentActive,
                  freeLineColor: ColorPaletteTheme.radialPercentFree,
                  fillColor: ColorPaletteTheme.radialPercentFill,
                  lineWidth: 3,
                  textStyle: TextStyleTheme.mainBoldWhite,
                ),
              ),
              SizedBox(width: 6),
              Text(
                'User Score',
                style: TextStyleTheme.mainBoldWhite,
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
                  style: TextStyleTheme.mainWhite,
                ),
              ],
            ))
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
        color: ColorPaletteTheme.backgroundDarker,
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
            style: TextStyleTheme.mainWhite,
          ),
          Text(
            'Action, Adventure, Fantasy',
            style: TextStyleTheme.mainWhite,
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
          style: TextStyleTheme.subtitleCursive,
        ),
        SizedBox(height: 12.0),
        Text(
          'Overview',
          style: TextStyleTheme.itemTitleWhite,
        ),
        SizedBox(height: 10.0),
        Text(
          'Shang-Chi must confront the past he thought he left behind when he is drawn into the web of the mysterious Ten Rings organization.',
          style: TextStyleTheme.mainWhite,
        ),
      ],
    );
  }
}

class _MembersWidget extends StatelessWidget {
  List<Member> data;

  _MembersWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Wrap(
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
      width: 230.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            fullName,
            style: TextStyleTheme.mainBoldWhite,
          ),
          const SizedBox(height: 3),
          Text(
            position,
            style: TextStyleTheme.mainWhite,
          ),
        ],
      ),
    );
  }
}
