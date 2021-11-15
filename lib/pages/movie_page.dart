import 'package:flutter/material.dart';
import 'package:moovee_land/theme/colors_theme.dart';
import 'package:moovee_land/widgets/movie_page/movie_actors_widget.dart';
import 'package:moovee_land/widgets/movie_page/movie_info_widget.dart';

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
          ColoredBox(
            color: ColorPaletteTheme.backgroundDark,
            child: MovieInfoWidget(),
          ),
          MovieActorsWidget(),
        ],
      ),
    );
  }
}
