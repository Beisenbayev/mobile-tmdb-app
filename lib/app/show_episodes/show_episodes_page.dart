import 'package:flutter/material.dart';
import 'package:moovee_land/core/models/show_episodes_model.dart';
import 'package:provider/provider.dart';

class ShowEpisodesPage extends StatelessWidget {
  const ShowEpisodesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _details = context.select((ShowEpisodesModel model) => model.details);
    final _body = (_details == null)
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
        Text('episode'),
        //_TopPosterWidget(),
        SizedBox(height: 5),
        // Expanded(
        //   child: ShowSeasonsListWidget(),
        // )
      ],
    );
  }
}
