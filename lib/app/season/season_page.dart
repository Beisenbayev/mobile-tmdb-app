import 'package:flutter/material.dart';
import 'package:moovee_land/app/season/widgets/season_episodes_list_widget.dart';
import 'package:moovee_land/app/season/widgets/season_info_widget.dart';
import 'package:moovee_land/core/models/season_page_model.dart';
import 'package:provider/provider.dart';

class SeasonPage extends StatelessWidget {
  const SeasonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _showDetails =
        context.select((SeasonPageModel model) => model.showDetails);
    final _seasonDetails =
        context.select((SeasonPageModel model) => model.seasonDetails);
    final _body = (_showDetails == null || _seasonDetails == null)
        ? const Center(child: CircularProgressIndicator())
        : const _SeasonPageBody();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Episodes'),
      ),
      body: _body,
    );
  }
}

class _SeasonPageBody extends StatelessWidget {
  const _SeasonPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SeasonInfoWidget(),
        SizedBox(height: 5),
        Expanded(
          child: SeasonEpisodesListWidget(),
        )
      ],
    );
  }
}
