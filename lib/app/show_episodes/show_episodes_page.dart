import 'package:flutter/material.dart';
import 'package:moovee_land/app/show_episodes/widgets/show_episodes_list_widget.dart';
import 'package:moovee_land/app/show_episodes/widgets/show_season_info_widget.dart';
import 'package:moovee_land/core/models/show_episodes_model.dart';
import 'package:provider/provider.dart';

class ShowEpisodesPage extends StatelessWidget {
  const ShowEpisodesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _showDetails =
        context.select((ShowEpisodesModel model) => model.showDetails);
    final _seasonDetails =
        context.select((ShowEpisodesModel model) => model.seasonDetails);
    final _body = (_showDetails == null || _seasonDetails == null)
        ? const Center(child: CircularProgressIndicator())
        : const _SeasonsListPageBody();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Episodes'),
      ),
      body: _body,
    );
  }
}

class _SeasonsListPageBody extends StatelessWidget {
  const _SeasonsListPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        ShowSeasonInfoWidget(),
        SizedBox(height: 5),
        Expanded(
          child: ShowEpisodesListWidget(),
        )
      ],
    );
  }
}
