import 'package:flutter/material.dart';
import 'package:moovee_land/modules/movie_data.dart';
import 'package:moovee_land/theme/text_theme.dart';
import 'package:moovee_land/widgets/search_panel_widget.dart';

class MovieListWidget extends StatefulWidget {
  const MovieListWidget({Key? key}) : super(key: key);

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  final _movies = MoviesCollection.movies;
  List<Movie> _searchedMovies = [];

  void handleSearch(String text) {
    setState(() {
      if (text.isNotEmpty) {
        _searchedMovies = _movies.where((element) {
          return element.title.toLowerCase().contains(text.toLowerCase());
        }).toList();
      } else {
        _searchedMovies = _movies;
      }
    });
  }

  @override
  void initState() {
    super.initState();

    _searchedMovies = _movies;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 0),
          child: SearchPanelWidget(searchHandler: handleSearch),
        ),
        const SizedBox(height: 5),
        Expanded(
          child: ListView.builder(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            itemCount: _searchedMovies.length,
            itemExtent: 170,
            itemBuilder: (BuildContext context, int index) {
              final Movie movie = _searchedMovies[index];
              return Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                child: MovieCardWidget(data: movie),
              );
            },
          ),
        ),
      ],
    );
  }
}

class MovieCardWidget extends StatelessWidget {
  final Movie data;

  const MovieCardWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: <Widget>[
          Row(
            children: <Widget>[
              Image(
                image: AssetImage(data.imageName),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      data.title,
                      style: TextStyleTheme.itemTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      data.date,
                      style: TextStyleTheme.subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      data.description,
                      style: TextStyleTheme.main,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 5),
            ],
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                print('ok');
              },
            ),
          )
        ],
      ),
    );
  }
}
