import 'package:flutter/material.dart';
import 'package:moovee_land/app/movie/widgets/movie_actors_widget.dart';
import 'package:moovee_land/app/movie/widgets/movie_contributors_widget.dart';
import 'package:moovee_land/app/movie/widgets/movie_discussions_widget.dart';
import 'package:moovee_land/app/movie/widgets/movie_facts_widget.dart';
import 'package:moovee_land/app/movie/widgets/movie_info_widget.dart';
import 'package:moovee_land/app/movie/widgets/movie_keywords_widget.dart';
import 'package:moovee_land/app/movie/widgets/movie_recommendations_widget.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MooVee'),
      ),
      body: ListView(
        children: <Widget>[
          MovieInfoWidget(),
          MovieActorsWidget(),
          const Divider(height: 1, color: Color.fromRGBO(200, 200, 200, 1)),
          MovieDiscussionsWidget(),
          const Divider(height: 1, color: Color.fromRGBO(200, 200, 200, 1)),
          MovieRecommendationsWidget(),
          MovieFactsWidget(),
          MovieKeywordsWidget(),
          const Divider(height: 1, color: Color.fromRGBO(200, 200, 200, 1)),
          MovieContributorsWidget(),
        ],
      ),
    );
  }
}
