import 'package:flutter/material.dart';
import 'package:moovee_land/app/movie_credits/widgets/movie_credits_list_widget.dart';
import 'package:moovee_land/core/consts/padding_consts.dart';
import 'package:moovee_land/core/models/movie_page_model.dart';
import 'package:moovee_land/core/models/utils/model_utils.dart';
import 'package:moovee_land/core/theme/colors_theme.dart';
import 'package:moovee_land/core/theme/text_theme.dart';
import 'package:provider/provider.dart';

class MovieCreditsPage extends StatelessWidget {
  const MovieCreditsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _details = context.select((MoviePageModel model) => model.details);
    final _credits = context.select((MoviePageModel model) => model.credits);
    final _body = (_details == null || _credits == null)
        ? const Center(child: CircularProgressIndicator())
        : const _MovieCreditsPageBody();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cast'),
      ),
      body: _body,
    );
  }
}

class _MovieCreditsPageBody extends StatelessWidget {
  const _MovieCreditsPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        _TopPosterWidget(),
        SizedBox(height: 5),
        Expanded(
          child: MovieCreditsListWidget(),
        )
      ],
    );
  }
}

class _TopPosterWidget extends StatelessWidget {
  const _TopPosterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _details = context.select((MoviePageModel model) => model.details!);
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
    final _details = context.select((MoviePageModel model) => model.details!);
    final _date = ModelUtils.parseDateTime(_details.releaseDate, 'yMMMMd');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _details.title,
          style: TextThemeShelf.itemTitleWhite,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 5),
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
