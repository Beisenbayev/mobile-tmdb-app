import 'package:flutter/material.dart';
import 'package:moovee_land/client_api/entities/media/media_discussions.dart';
import 'package:moovee_land/core/consts/padding_consts.dart';
import 'package:moovee_land/core/models/utils/model_utils.dart';
import 'package:moovee_land/core/models/movie_page_model.dart';
import 'package:moovee_land/core/theme/text_theme.dart';
import 'package:moovee_land/core/theme/widget_theme.dart';
import 'package:moovee_land/core/widgets/rating_widget.dart';
import 'package:provider/provider.dart';

class MovieDiscussionsWidget extends StatelessWidget {
  const MovieDiscussionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _discussions =
        context.select((MoviePageModel model) => model.discussions);

    if (_discussions == null || _discussions.reviews.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 6,
        horizontal: PaddingConsts.screenHorizontal,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          _TitleWidget(),
          SizedBox(height: 4.0),
          _DiscussionsListWidget(),
          SizedBox(height: 14),
        ],
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Discussions',
          style: TextThemeShelf.itemTitle,
        ),
        TextButton(
          onPressed: () {},
          child: const Text('All'),
        )
      ],
    );
  }
}

class _DiscussionsListWidget extends StatelessWidget {
  const _DiscussionsListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _discussions =
        context.select((MoviePageModel model) => model.discussions!);
    final _reviews = (_discussions.reviews.length > 2)
        ? _discussions.reviews.sublist(0, 2)
        : _discussions.reviews;

    return Column(
      children: _reviews.map((item) {
        return Container(
          height: 255.0,
          margin: const EdgeInsets.symmetric(vertical: 6),
          child: _DiscussionsCardWidget(discussion: item),
        );
      }).toList(),
    );
  }
}

class _DiscussionsCardWidget extends StatelessWidget {
  final Discussion discussion;

  const _DiscussionsCardWidget({
    Key? key,
    required this.discussion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _avatar =
        ModelUtils.getSecuredActorImage(discussion.authorDetails.avatarPath);
    final _date = ModelUtils.parseDateTime(discussion.createdAt, 'yMMMMd');
    final _ratingWidget = (discussion.authorDetails.rating != null)
        ? MediaRatingWidget(
            rating: discussion.authorDetails.rating!.toStringAsFixed(0),
            marginTop: 10.0,
          )
        : const SizedBox.shrink();
    final _username = discussion.author.isNotEmpty
        ? discussion.author
        : discussion.authorDetails.username;

    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: WidgetThemeShelf.roundedCardTheme,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 64,
                      height: 64,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: _avatar,
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'A review by $_username',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextThemeShelf.itemTitle,
                          ),
                          _ratingWidget,
                          const SizedBox(height: 10),
                          Text(
                            'Written by $_username on $_date',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextThemeShelf.subtitle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Text(
                  discussion.content,
                  maxLines: 5,
                  style: TextThemeShelf.main,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
