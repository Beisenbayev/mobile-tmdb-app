import 'package:flutter/material.dart';
import 'package:moovee_land/app/show_credits/widgets/show_credits_list_widget.dart';
import 'package:moovee_land/core/consts/padding_consts.dart';
import 'package:moovee_land/core/models/show_page_model.dart';
import 'package:moovee_land/core/models/utils/model_utils.dart';
import 'package:moovee_land/core/theme/colors_theme.dart';
import 'package:moovee_land/core/theme/text_theme.dart';
import 'package:provider/provider.dart';

class ShowCreditsPage extends StatelessWidget {
  const ShowCreditsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _details = context.select((ShowPageModel model) => model.details);
    final _credits = context.select((ShowPageModel model) => model.credits);
    final _body = (_details == null || _credits == null)
        ? const Center(child: CircularProgressIndicator())
        : const _ShowCreditsPageBody();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cast'),
      ),
      body: _body,
    );
  }
}

class _ShowCreditsPageBody extends StatelessWidget {
  const _ShowCreditsPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        _TopPosterWidget(),
        SizedBox(height: 5),
        Expanded(
          child: ShowCreditsListWidget(),
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
    final _date = ModelUtils.parseDateTime(_details.firstAirDate, 'yMMMMd');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _details.originalName,
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
