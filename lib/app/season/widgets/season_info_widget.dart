import 'package:flutter/material.dart';
import 'package:moovee_land/core/consts/padding_consts.dart';
import 'package:moovee_land/core/models/season_page_model.dart';
import 'package:moovee_land/core/models/utils/model_utils.dart';
import 'package:moovee_land/core/theme/colors_theme.dart';
import 'package:moovee_land/core/theme/text_theme.dart';
import 'package:provider/provider.dart';

class SeasonInfoWidget extends StatelessWidget {
  const SeasonInfoWidget({Key? key}) : super(key: key);

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
        context.select((SeasonPageModel model) => model.seasonDetails!);
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
        context.select((SeasonPageModel model) => model.showDetails!);
    final _seasonDetails =
        context.select((SeasonPageModel model) => model.seasonDetails!);
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

class _DescriptionWidget extends StatefulWidget {
  const _DescriptionWidget({Key? key}) : super(key: key);

  @override
  State<_DescriptionWidget> createState() => _DescriptionWidgetState();
}

class _DescriptionWidgetState extends State<_DescriptionWidget> {
  bool _isOverviewShowed = false;

  void toggleOverviewPanel() {
    setState(() => {_isOverviewShowed = !_isOverviewShowed});
  }

  @override
  Widget build(BuildContext context) {
    final _overview = context
        .select((SeasonPageModel model) => model.seasonDetails!.overview);
    final _icon =
        _isOverviewShowed ? Icons.arrow_drop_up : Icons.arrow_drop_down;
    final _overviewWidget = _isOverviewShowed
        ? Text(_overview, style: TextThemeShelf.mainWhite)
        : const SizedBox.shrink();

    if (_overview.isEmpty) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextButton(
            onPressed: toggleOverviewPanel,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Overview',
                  style: TextThemeShelf.itemTitleWhite,
                ),
                const SizedBox(width: 10),
                Icon(_icon, size: 24, color: Colors.white),
              ],
            ),
          ),
          _overviewWidget
        ],
      ),
    );
  }
}
