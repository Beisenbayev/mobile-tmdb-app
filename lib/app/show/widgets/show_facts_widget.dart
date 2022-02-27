import 'package:flutter/material.dart';
import 'package:moovee_land/core/consts/padding_consts.dart';
import 'package:moovee_land/core/models/show_page_model.dart';
import 'package:moovee_land/core/theme/text_theme.dart';
import 'package:provider/provider.dart';

class ShowFactsWidget extends StatelessWidget {
  const ShowFactsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _details = context.select((ShowPageModel model) => model.details!);
    final _network = _details.networks.map((e) => e.name).toList().join('');

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: PaddingConsts.screenHorizontal,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ShowFactItemWidget(
            title: 'Status',
            description: _details.status,
          ),
          _ShowFactItemWidget(
            title: 'Original Language',
            description: _details.originalLanguage.toUpperCase(),
          ),
          _ShowFactItemWidget(
            title: 'Network',
            description: _network,
          ),
          _ShowFactItemWidget(
            title: 'Type',
            description: _details.type,
          ),
        ],
      ),
    );
  }
}

class _ShowFactItemWidget extends StatelessWidget {
  final String title;
  final String description;

  const _ShowFactItemWidget({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextThemeShelf.mainBold,
          ),
          const SizedBox(height: 3.0),
          Text(
            description,
            style: TextThemeShelf.main,
          ),
        ],
      ),
    );
  }
}
