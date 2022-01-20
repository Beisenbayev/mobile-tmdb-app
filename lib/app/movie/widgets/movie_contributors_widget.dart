import 'package:flutter/material.dart';
import 'package:moovee_land/core/modules/movie_contributors_data.dart';
import 'package:moovee_land/core/theme/text_theme.dart';

class MovieContributorsWidget extends StatelessWidget {
  final List<Contributor> _contributors = ContributorsCollection.contributors;

  MovieContributorsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _TitleWidget(),
          _ContributorsListWidget(contributors: _contributors),
        ],
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text(
      'Top Contributors',
      style: TextThemeShelf.itemTitle,
    );
  }
}

class _ContributorsListWidget extends StatelessWidget {
  final List<Contributor> contributors;

  const _ContributorsListWidget({
    Key? key,
    required this.contributors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: contributors.map((item) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 3.0),
          height: 60,
          child: ContributorCardWidget(data: item),
        );
      }).toList(),
    );
  }
}

class ContributorCardWidget extends StatelessWidget {
  final Contributor data;

  const ContributorCardWidget({
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
            padding: const EdgeInsets.only(top: 3.5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image(
                    image: AssetImage(data.imageName),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '${data.contributCount}',
                      style: TextThemeShelf.mainBold,
                    ),
                    Text(
                      data.fullName,
                      style: TextThemeShelf.main,
                    ),
                  ],
                )
              ],
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
            ),
          )
        ],
      ),
    );
  }
}
