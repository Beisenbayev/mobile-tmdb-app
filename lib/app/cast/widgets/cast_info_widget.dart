import 'package:flutter/material.dart';
import 'package:moovee_land/core/consts/padding_consts.dart';
import 'package:moovee_land/core/models/cast_page_model.dart';
import 'package:moovee_land/core/models/utils/model_utils.dart';
import 'package:moovee_land/core/theme/colors_theme.dart';
import 'package:moovee_land/core/theme/text_theme.dart';
import 'package:provider/provider.dart';

class CastInfoWidget extends StatelessWidget {
  const CastInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: ColorThemeShelf.backgroundDark,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16.0),
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
                _FactsWidget(),
                SizedBox(height: 16.0),
                _BiographyWidget(),
                SizedBox(height: 16.0),
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
    final _castDetails =
        context.select((CastPageModel model) => model.castDetails!);
    final _avatar = ModelUtils.getActorImage(_castDetails.profilePath);

    return Center(
      child: Container(
        width: 200,
        height: 200,
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
        ),
        child: _avatar,
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _castDetails =
        context.select((CastPageModel model) => model.castDetails!);

    return SizedBox(
      width: double.infinity,
      child: Text(
        _castDetails.name,
        style: TextThemeShelf.sectionTitleWhite,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _FactsWidget extends StatelessWidget {
  const _FactsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _castDetails =
        context.select((CastPageModel model) => model.castDetails!);
    final _gender = ModelUtils.getCastGender(_castDetails.gender);
    final _birthday = ModelUtils.parseDateTime(_castDetails.birthday, 'yMMMMd');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _CastFactItemWidget(
          title: 'Known For',
          description: _castDetails.knownForDepartment ?? '',
        ),
        _CastFactItemWidget(
          title: 'Gender',
          description: _gender,
        ),
        _CastFactItemWidget(
          title: 'Birhday',
          description: _birthday,
        ),
        _CastFactItemWidget(
          title: 'Place of Birth',
          description: _castDetails.placeOfBirth ?? '',
        )
      ],
    );
  }
}

class _CastFactItemWidget extends StatelessWidget {
  final String title;
  final String description;

  const _CastFactItemWidget({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextThemeShelf.mainWhite,
          ),
          const SizedBox(height: 3.0),
          Text(
            description,
            style: TextThemeShelf.subtitle,
          ),
        ],
      ),
    );
  }
}

class _BiographyWidget extends StatelessWidget {
  const _BiographyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _biography =
        context.select((CastPageModel model) => model.castDetails!.biography);

    if (_biography.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Biography',
          style: TextThemeShelf.itemTitleWhite,
        ),
        const SizedBox(height: 10),
        Text(
          _biography,
          style: TextThemeShelf.mainWhite,
        ),
      ],
    );
  }
}
