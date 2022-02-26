import 'package:flutter/material.dart';
import 'package:moovee_land/core/consts/padding_consts.dart';
import 'package:moovee_land/core/models/episode_page_model.dart';
import 'package:moovee_land/core/models/utils/model_utils.dart';
import 'package:moovee_land/core/theme/colors_theme.dart';
import 'package:moovee_land/core/theme/text_theme.dart';
import 'package:moovee_land/core/widgets/rating_widget.dart';
import 'package:provider/provider.dart';

class EpisodeInfoWidget extends StatelessWidget {
  const EpisodeInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: ColorThemeShelf.backgroundDark,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _TopPosterWidget(),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: PaddingConsts.screenHorizontal,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                _TitleWidget(),
                SizedBox(height: 16.0),
                _DescriptionWidget(),
                SizedBox(height: 26.0),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _TopPosterWidget extends StatelessWidget {
  const _TopPosterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _episodeDetails =
        context.select((EpisodePageModel model) => model.episodeDetails!);
    final _showBackdrop =
        ModelUtils.getBackdropImage(_episodeDetails.stillPath);

    return SizedBox(
      width: double.infinity,
      height: 200,
      child: _showBackdrop,
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _showDetails =
        context.select((EpisodePageModel model) => model.showDetails!);
    final _episodeDetails =
        context.select((EpisodePageModel model) => model.episodeDetails!);
    final _date = ModelUtils.parseDateTime(_episodeDetails.airDate, 'yMMMMd');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  _episodeDetails.name,
                  style: TextThemeShelf.itemTitleWhite,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(width: 16),
              MediaRatingWidget(
                rating: _episodeDetails.voteAverage.toStringAsFixed(1),
                colorTheme: MediaRatingColorTheme.light,
              )
            ],
          ),
        ),
        const SizedBox(height: 16.0),
        Text(
          _showDetails.name,
          style: TextThemeShelf.itemTitleWhite,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 5.0),
        Text(
          'Season ${_episodeDetails.seasonNumber}  |  Episode ${_episodeDetails.episodeNumber}',
          style: TextThemeShelf.mainWhite,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 5.0),
        Text(
          _date,
          style: TextThemeShelf.subtitle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

class _DescriptionWidget extends StatelessWidget {
  const _DescriptionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _overview = context
        .select((EpisodePageModel model) => model.episodeDetails!.overview);

    if (_overview.isEmpty) {
      return const SizedBox.shrink();
    }

    return Text(
      _overview,
      style: TextThemeShelf.mainWhite,
    );
  }
}
