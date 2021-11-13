import 'package:flutter/material.dart';

class SearchPanelWidget extends StatelessWidget {
  final void Function(String) searchHandler;

  const SearchPanelWidget({
    Key? key,
    required this.searchHandler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: 'Search',
        suffixIcon: const Icon(Icons.search),
      ),
      onChanged: searchHandler,
    );
  }
}
