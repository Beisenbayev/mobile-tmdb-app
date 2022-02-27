import 'package:flutter/material.dart';
import 'package:moovee_land/app/episode/widgets/episode_actors_widget.dart';
import 'package:moovee_land/app/episode/widgets/episode_info_widget.dart';
import 'package:moovee_land/core/models/episode_page_model.dart';
import 'package:provider/provider.dart';

class EpisodePage extends StatelessWidget {
  const EpisodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _showDetails =
        context.select((EpisodePageModel model) => model.showDetails);
    final _episodeDetails =
        context.select((EpisodePageModel model) => model.episodeDetails);
    final _body = (_showDetails == null || _episodeDetails == null)
        ? const Center(child: CircularProgressIndicator())
        : const _EpisodePageBody();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Episode'),
      ),
      body: _body,
    );
  }
}

class _EpisodePageBody extends StatelessWidget {
  const _EpisodePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          EpisodeInfoWidget(),
          EpisodeActorsWidget(),
        ],
      ),
    );
  }
}
