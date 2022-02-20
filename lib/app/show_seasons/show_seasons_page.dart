import 'package:flutter/material.dart';
import 'package:moovee_land/app/show_seasons/widgets/show_seasons_list_widget.dart';
import 'package:moovee_land/core/consts/padding_consts.dart';
import 'package:moovee_land/core/models/show_page_model.dart';
import 'package:moovee_land/core/models/utils/model_utils.dart';
import 'package:moovee_land/core/theme/colors_theme.dart';
import 'package:moovee_land/core/theme/text_theme.dart';
import 'package:provider/provider.dart';

class ShowSeasonsPage extends StatelessWidget {
  const ShowSeasonsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _details = context.select((ShowPageModel model) => model.details);
    final _body = (_details == null)
        ? const Center(child: CircularProgressIndicator())
        : const _SeasonsListPageBody();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Seasons'),
      ),
      body: _body,
    );
  }
}

class _SeasonsListPageBody extends StatelessWidget {
  const _SeasonsListPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        _TopPosterWidget(),
        SizedBox(height: 5),
        Expanded(
          child: ShowSeasonsListWidget(),
        )
      ],
    );
  }
}

class _TopPosterWidget extends StatelessWidget {
  const _TopPosterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _details = context.select((ShowPageModel model) => model.details!);
    final _poster = ModelUtils.getPosterImage(_details.posterPath);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: PaddingConsts.screenHorizontal,
        vertical: PaddingConsts.screenVertical,
      ),
      decoration: const BoxDecoration(
        color: ColorThemeShelf.backgroundDark,
      ),
      child: Row(
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
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _details = context.select((ShowPageModel model) => model.details!);
    final _seasonsCount = _details.seasons.length;
    final _date = ModelUtils.parseDateTime(_details.firstAirDate, 'yMMMMd');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _details.name,
          style: TextThemeShelf.itemTitleWhite,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          '$_seasonsCount seasons',
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
