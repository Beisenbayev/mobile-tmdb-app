import 'package:flutter/material.dart';
import 'package:moovee_land/app/home/widgets/movies_list_widget.dart';
import 'package:moovee_land/app/home/widgets/news_feed_widget.dart';
import 'package:moovee_land/app/home/widgets/shows_list_widget.dart';
import 'package:moovee_land/core/models/movies_list_model.dart';
import 'package:moovee_land/core/models/news_feed_model.dart';
import 'package:moovee_land/core/models/shows_list_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    ChangeNotifierProvider(
      create: (context) => NewsFeedModel(),
      child: const NewsFeedWidget(),
    ),
    ChangeNotifierProvider(
      create: (context) => MoviesListModel(),
      child: const MoviesListWidget(),
    ),
    ChangeNotifierProvider(
      create: (context) => ShowsListModel(),
      child: const ShowsListWidget(),
    ),
  ];

  void handleSelectItem(index) {
    if (_selectedIndex == index) return;
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MooVee'),
      ),
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: handleSelectItem,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_movies_rounded),
            label: 'Movies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'Shows',
          ),
        ],
      ),
    );
  }
}
