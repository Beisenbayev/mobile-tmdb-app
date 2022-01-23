import 'package:flutter/material.dart';
import 'package:moovee_land/app/home/widgets/movie_list_widget.dart';
import 'package:moovee_land/core/models/movies_list_model.dart';
import 'package:moovee_land/core/storage/session_storage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const Text('News'),
    MoviesListProvider(
      model: MoviesListModel(),
      child: const MoviesListWidget(),
    ),
    ElevatedButton(
        onPressed: () async {
          final _sessionStorage = SessionStorage();
          await _sessionStorage.setSessionId(null);
        },
        child: const Text('logout')),
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
