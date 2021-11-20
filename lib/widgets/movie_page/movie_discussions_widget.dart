import 'package:flutter/material.dart';
import 'package:moovee_land/modules/movie_discussions_data.dart';
import 'package:moovee_land/theme/text_theme.dart';

class MovieDiscussionsWidget extends StatelessWidget {
  final List<Discussion> _discussions = DiscussionsCollection.discussions;

  MovieDiscussionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color.fromRGBO(215, 215, 215, 1),
            width: 1,
          ),
        ),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _TitleWidget(),
          const SizedBox(height: 16.0),
          _DiscussionsListWidget(
            discussions: _discussions,
          ),
          const SizedBox(height: 16.0),
          _DiscussionsPageButtonWidget(),
        ],
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text(
      'Socile',
      style: TextStyleTheme.itemTitle,
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
          padding: const EdgeInsets.symmetric(vertical: 3.0),
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
    return Card(
      clipBehavior: Clip.hardEdge,
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
                        style: TextStyleTheme.main,
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
                        style: TextStyleTheme.small,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '${data.repliesCount}',
                        style: TextStyleTheme.small,
                      ),
                    ),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '${data.date} by ',
                              style: TextStyleTheme.small,
                            ),
                            TextSpan(
                              text: data.username,
                              style: TextStyleTheme.smallBold,
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

class _DiscussionsPageButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: const Text(
        'Go to Discussions',
        style: TextStyleTheme.mainBold,
      ),
    );
  }
}
