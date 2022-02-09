import 'package:flutter/material.dart';
import 'package:moovee_land/client_api/entity/movie_discussions.dart';
import 'package:moovee_land/core/consts/padding_consts.dart';
import 'package:moovee_land/core/models/model_utils.dart';
import 'package:moovee_land/core/models/movie_page_model.dart';
import 'package:moovee_land/core/theme/text_theme.dart';
import 'package:moovee_land/core/theme/widget_theme.dart';
import 'package:provider/provider.dart';

class MovieDiscussionsWidget extends StatelessWidget {
  const MovieDiscussionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _discussions = Provider.of<MoviePageModel>(context).discussions;

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
    final _discussions = Provider.of<MoviePageModel>(context).discussions!;
    final _reviews = (_discussions.reviews.length > 2)
        ? _discussions.reviews.sublist(0, 2)
        : _discussions.reviews;

    return Column(
      children: _reviews.map((item) {
        return Container(
          height: 255.0,
          margin: const EdgeInsets.symmetric(vertical: 6),
          child: DiscussionsCardWidget(discussion: item),
        );
      }).toList(),
    );
  }
}

class DiscussionsCardWidget extends StatelessWidget {
  final Discussion discussion;

  const DiscussionsCardWidget({
    Key? key,
    required this.discussion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _avatar =
        ModelUtils.getSecuredActorImage(discussion.authorDetails.avatarPath);
    final _date = ModelUtils.parseDateTime(discussion.createdAt, 'yMMMMd');
    final _ratingWidget = (discussion.authorDetails.rating != null)
        ? _ReviewerRatingWidget(
            rating: discussion.authorDetails.rating!.toStringAsFixed(0))
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

class _ReviewerRatingWidget extends StatelessWidget {
  final String rating;

  const _ReviewerRatingWidget({
    Key? key,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 24,
      margin: const EdgeInsets.only(top: 10),
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.star_rate_rounded,
              size: 14,
              color: Colors.white,
            ),
            const SizedBox(width: 3),
            Text(
              rating,
              style: TextThemeShelf.smallWhite,
            ),
          ],
        ),
      ),
    );
  }
}
