import 'package:flutter/material.dart';
import 'package:moovee_land/app/show/widgets/show_info_widget.dart';
import 'package:moovee_land/core/models/show_page_model.dart';
import 'package:provider/provider.dart';

class ShowPage extends StatelessWidget {
  const ShowPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _ditails = context.select((ShowPageModel model) => model.ditails);
    final _body = (_ditails == null)
        ? const Center(child: CircularProgressIndicator())
        : const _ShowPageBody();

    return Scaffold(
      appBar: AppBar(
        title: const Text('MooVee'),
      ),
      body: _body,
    );
  }
}

class _ShowPageBody extends StatelessWidget {
  const _ShowPageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          ShowInfoWidget(),
        ],
      ),
    );
  }
}
