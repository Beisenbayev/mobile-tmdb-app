import 'package:flutter/material.dart';
import 'package:moovee_land/widgets/movie_page/movie_actors_widget.dart';
import 'package:moovee_land/widgets/movie_page/movie_facts_widget.dart';
import 'package:moovee_land/widgets/movie_page/movie_info_widget.dart';
import 'package:moovee_land/widgets/movie_page/movie_keywords_widget.dart';
import 'package:moovee_land/widgets/movie_page/movie_recommendations_widget.dart';

class MoviePage extends StatefulWidget {
  final int id;

  const MoviePage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
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
          MovieRecommendationsWidget(),
          MovieFactsWidget(),
          MovieKeywordsWidget(),
        ],
      ),
    );
  }
}
