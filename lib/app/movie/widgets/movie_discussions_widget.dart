import 'package:flutter/material.dart';
import 'package:moovee_land/core/consts/padding_consts.dart';
import 'package:moovee_land/core/modules/movie_discussions_data.dart';
import 'package:moovee_land/core/theme/text_theme.dart';
import 'package:moovee_land/core/theme/widget_theme.dart';

class MovieDiscussionsWidget extends StatelessWidget {
  final List<Discussion> _discussions = DiscussionsCollection.discussions;

  MovieDiscussionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 6,
        horizontal: PaddingConsts.screenHorizontal,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _TitleWidget(),
          const SizedBox(height: 4.0),
          _DiscussionsListWidget(
            discussions: _discussions,
          ),
          const SizedBox(height: 14),
        ],
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
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
  final List<Discussion> discussions;

  const _DiscussionsListWidget({
    Key? key,
    required this.discussions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: discussions.map((item) {
        return Container(
          height: 120.0,
          margin: const EdgeInsets.symmetric(vertical: 6),
          child: DiscussionsCardWidget(data: item),
        );
      }).toList(),
    );
  }
}

class DiscussionsCardWidget extends StatelessWidget {
  final Discussion data;

  const DiscussionsCardWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image(image: AssetImage(data.imageName)),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: Text(
                        data.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextThemeShelf.main,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 3.0),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        data.type,
                        style: TextThemeShelf.small,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '${data.repliesCount}',
                        style: TextThemeShelf.small,
                      ),
                    ),
                    Expanded(
                      child: RichText(
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '${data.date} by ',
                              style: TextThemeShelf.small,
                            ),
                            TextSpan(
                              text: data.username,
                              style: TextThemeShelf.smallBold,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
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
