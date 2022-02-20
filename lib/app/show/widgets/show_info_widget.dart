import 'package:flutter/material.dart';
import 'package:moovee_land/core/consts/padding_consts.dart';
import 'package:moovee_land/core/models/show_page_model.dart';
import 'package:moovee_land/core/models/utils/model_utils.dart';
import 'package:moovee_land/core/theme/colors_theme.dart';
import 'package:moovee_land/core/theme/text_theme.dart';
import 'package:moovee_land/core/widgets/radial_percent_widget.dart';
import 'package:moovee_land/core/widgets/rounded_icon_button.dart';
import 'package:moovee_land/router/navigation_controller.dart';
import 'package:provider/provider.dart';

class ShowInfoWidget extends StatelessWidget {
  const ShowInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: ColorThemeShelf.backgroundDark,
      child: Column(
        children: <Widget>[
          const _TopPosterWidget(),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: PaddingConsts.screenHorizontal,
            ),
            child: Column(
              children: const <Widget>[
                _TitleWidget(),
                SizedBox(height: 16.0),
                _UserScoreWidget(),
                SizedBox(height: 16.0),
                _GenreWidget(),
                SizedBox(height: 20.0),
                _DescriptionWidget(),
                SizedBox(height: 30.0),
                _MembersWidget(),
                SizedBox(height: 26.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TopPosterWidget extends StatelessWidget {
  const _TopPosterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _model = context.read<ShowPageModel>();
    final _details = context.select((ShowPageModel model) => model.details!);
    final _isFavorite =
        context.select((ShowPageModel model) => model.isFavorite);
    final _isInWatchlist =
        context.select((ShowPageModel model) => model.isInWatchlist);

    final _showBackdrop = ModelUtils.getBackdropImage(_details.backdropPath);
    final _showPoster = ModelUtils.getPosterImage(_details.posterPath);
    final _favoriteIcon = _isFavorite
        ? const Icon(Icons.favorite_rounded)
        : const Icon(Icons.favorite_outline_rounded);
    final _favoriteColor = _isFavorite ? Colors.red : Colors.white;
    final _watchlistIcon = _isInWatchlist
        ? const Icon(Icons.bookmark_rounded)
        : const Icon(Icons.bookmark_add_outlined);
    final _watchlistColor =
        _isInWatchlist ? ColorThemeShelf.radialPercentActive : Colors.white;

    return Stack(
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          height: 200,
          child: _showBackdrop,
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
            child: _showPoster,
          ),
        ),
        Positioned(
          top: 20,
          right: PaddingConsts.screenHorizontal,
          child: RoundedIconButton(
            icon: _favoriteIcon,
            color: _favoriteColor,
            onTap: _model.markShowAsFavorite,
          ),
        ),
        Positioned(
          bottom: 20,
          right: PaddingConsts.screenHorizontal,
          child: RoundedIconButton(
            icon: _watchlistIcon,
            color: _watchlistColor,
            onTap: _model.addShowToWatchlist,
          ),
        ),
      ],
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _details = context.select((ShowPageModel model) => model.details!);
    final _year = ModelUtils.parseDateTime(_details.firstAirDate, 'y');

    return RichText(
      maxLines: 3,
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: _details.name,
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
  const _UserScoreWidget({Key? key}) : super(key: key);

  void handleShowTrailer(BuildContext context, String key) {
    NavigationController.goToTrailerPage(context, key);
  }

  @override
  Widget build(BuildContext context) {
    final _details = context.select((ShowPageModel model) => model.details!);
    final _videos = context.select((ShowPageModel model) => model.videos!);
    final _videoKey = ModelUtils.getOfficialTrailerKey(_videos.trailers);
    final _mainAlignment = _videoKey.isNotEmpty
        ? MainAxisAlignment.spaceEvenly
        : MainAxisAlignment.center;
    final _playButton = _videoKey.isNotEmpty
        ? _PlayTrailerButtonWidget(
            handleOnTap: () => handleShowTrailer(context, _videoKey),
          )
        : const SizedBox.shrink();
    final _dividerLine = _videoKey.isNotEmpty
        ? Container(width: 1, height: 24, color: Colors.white.withOpacity(0.3))
        : const SizedBox.shrink();

    return Row(
      mainAxisAlignment: _mainAlignment,
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
                  percent: (_details.voteAverage * 10),
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
        _dividerLine,
        _playButton,
      ],
    );
  }
}

class _PlayTrailerButtonWidget extends StatelessWidget {
  final void Function() handleOnTap;

  const _PlayTrailerButtonWidget({
    Key? key,
    required this.handleOnTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: handleOnTap,
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
    );
  }
}

class _GenreWidget extends StatelessWidget {
  const _GenreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _info = '';
    final _details = context.select((ShowPageModel model) => model.details!);
    final _date = ModelUtils.parseDateTime(_details.firstAirDate, 'yMd');
    if (_date.isNotEmpty) _info = _date;
    final _country = _details.productionCountries.isNotEmpty
        ? _details.productionCountries[0].iso31661
        : '';
    if (_country.replaceAll(' ', '').isNotEmpty) _info = '$_info ($_country)';
    final _hours = _details.episodeRunTime.isNotEmpty
        ? ModelUtils.getHoursFromMinute(_details.episodeRunTime[0])
        : '';
    if (_hours.replaceAll(' ', '').isNotEmpty) _info = '$_info • $_hours';
    final _genres =
        _details.genres.map((ganre) => ganre.name).toList().join(', ');
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
  const _DescriptionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _details = context.select((ShowPageModel model) => model.details!);
    final tagline = (_details.tagline != null && _details.tagline!.isNotEmpty)
        ? Column(
            children: [
              Text(_details.tagline!, style: TextThemeShelf.subtitleCursive),
              const SizedBox(height: 12.0)
            ],
          )
        : const SizedBox.shrink();

    final overview =
        (_details.overview != null && _details.overview!.isNotEmpty)
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Overview', style: TextThemeShelf.itemTitleWhite),
                  const SizedBox(height: 10.0),
                  Text(_details.overview!, style: TextThemeShelf.mainWhite),
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
  const _MembersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _credits = context.select((ShowPageModel model) => model.credits);

    if (_credits == null) return const SizedBox.shrink();
    final _crew = (_credits.crew.length > 6)
        ? _credits.crew.sublist(0, 6)
        : _credits.crew;

    return SizedBox(
      width: double.infinity,
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        children: _crew.map((item) {
          final _jobTitle = ModelUtils.getCrewJobTitle(item.jobs);

          return _MemberProfileWidget(
            fullName: item.originalName,
            position: _jobTitle,
          );
        }).toList(),
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
