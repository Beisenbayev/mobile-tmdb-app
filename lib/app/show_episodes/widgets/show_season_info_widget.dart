import 'package:flutter/material.dart';
import 'package:moovee_land/core/consts/padding_consts.dart';
import 'package:moovee_land/core/models/show_episodes_model.dart';
import 'package:moovee_land/core/models/utils/model_utils.dart';
import 'package:moovee_land/core/theme/colors_theme.dart';
import 'package:moovee_land/core/theme/text_theme.dart';
import 'package:provider/provider.dart';

class ShowSeasonInfoWidget extends StatelessWidget {
  const ShowSeasonInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: PaddingConsts.screenVertical,
        horizontal: PaddingConsts.screenHorizontal,
      ),
      decoration: const BoxDecoration(
        color: ColorThemeShelf.backgroundDark,
      ),
      child: Column(
        children: const [
          _TopPosterWidget(),
          _DescriptionWidget(),
        ],
      ),
    );
  }
}

class _TopPosterWidget extends StatelessWidget {
  const _TopPosterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _details =
        context.select((ShowEpisodesModel model) => model.seasonDetails!);
    final _poster = ModelUtils.getPosterImage(_details.posterPath);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 60,
          height: 90,
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
          child: _poster,
        ),
        const SizedBox(width: 20),
        const Expanded(
          child: _TitleWidget(),
        )
      ],
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _showDetails =
        context.select((ShowEpisodesModel model) => model.showDetails!);
    final _seasonDetails =
        context.select((ShowEpisodesModel model) => model.seasonDetails!);
    final _episodesCount = _seasonDetails.episodes.length;
    final _date = ModelUtils.parseDateTime(_seasonDetails.airDate, 'yMMMMd');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _showDetails.name,
          style: TextThemeShelf.itemTitleWhite,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          '${_seasonDetails.name}  |  $_episodesCount episodes',
          style: TextThemeShelf.mainWhite,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
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
        .select((ShowEpisodesModel model) => model.seasonDetails!.overview);

    if (_overview.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      margin: const EdgeInsets.only(top: 16.0),
      child: Text(_overview, style: TextThemeShelf.mainWhite),
    );
  }
}
