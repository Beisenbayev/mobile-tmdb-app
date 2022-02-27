import 'package:flutter/material.dart';
import 'package:moovee_land/app/cast/widgets/cast_info_widget.dart';
import 'package:moovee_land/core/models/cast_page_model.dart';
import 'package:provider/provider.dart';

class CastPage extends StatelessWidget {
  const CastPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _castDetails =
        context.select((CastPageModel model) => model.castDetails);
    final _body = (_castDetails == null)
        ? const Center(child: CircularProgressIndicator())
        : const _CastPageBody();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cast'),
      ),
      body: _body,
    );
  }
}

class _CastPageBody extends StatelessWidget {
  const _CastPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CastInfoWidget(),
        ],
      ),
    );
  }
}
