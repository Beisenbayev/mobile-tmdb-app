import 'package:flutter/material.dart';
import 'package:moovee_land/app/movie/widgets/movie_actors_widget.dart';
import 'package:moovee_land/app/movie/widgets/movie_discussions_widget.dart';
import 'package:moovee_land/app/movie/widgets/movie_facts_widget.dart';
import 'package:moovee_land/app/movie/widgets/movie_info_widget.dart';
import 'package:moovee_land/app/movie/widgets/movie_keywords_widget.dart';
import 'package:moovee_land/app/movie/widgets/movie_recommendations_widget.dart';
import 'package:moovee_land/app/movie/widgets/movie_similar_widget.dart';
import 'package:moovee_land/core/models/movie_page_model.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _model = MoviePageProvider.of(context)!.model;
    final _body = (_model.ditails == null)
        ? const Center(child: CircularProgressIndicator())
        : const _MoviePageBody();

    return Scaffold(
      appBar: AppBar(
        title: const Text('MooVee'),
      ),
      body: _body,
    );
  }
}

class _MoviePageBody extends StatelessWidget {
  const _MoviePageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <Widget>[
        MovieInfoWidget(),
        MovieActorsWidget(),
        Divider(height: 1, color: Color.fromRGBO(200, 200, 200, 1)),
        MovieDiscussionsWidget(),
        Divider(height: 1, color: Color.fromRGBO(200, 200, 200, 1)),
        MovieRecommendationsWidget(),
        MovieFactsWidget(),
        MovieKeywordsWidget(),
        Divider(height: 1, color: Color.fromRGBO(200, 200, 200, 1)),
        MovieSimilarWidget(),
      ],
    );
  }
}
