import 'package:flutter/material.dart';
import 'package:moovee_land/core/models/episode_page_model.dart';
import 'package:provider/provider.dart';

class EpisodePage extends StatelessWidget {
  const EpisodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _details = context.select((EpisodePageModel model) => model.details);
    final _body = (_details != null)
        ? const _EpisodePageBody()
        : const CircularProgressIndicator();

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
    return Text('episode');
  }
}
