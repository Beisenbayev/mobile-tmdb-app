import 'package:flutter/material.dart';
import 'package:moovee_land/client_api/entities/show/show_aggregate_credits.dart';
import 'package:moovee_land/core/consts/padding_consts.dart';
import 'package:moovee_land/core/models/show_page_model.dart';
import 'package:moovee_land/core/models/utils/model_utils.dart';
import 'package:moovee_land/core/theme/text_theme.dart';
import 'package:moovee_land/core/theme/widget_theme.dart';
import 'package:moovee_land/router/navigation_controller.dart';
import 'package:provider/provider.dart';

class ShowCreditsListWidget extends StatelessWidget {
  const ShowCreditsListWidget({Key? key}) : super(key: key);

  void handleShowCastPage(BuildContext context, int castId) {
    NavigationController.goToCastPage(context, castId);
  }

  @override
  Widget build(BuildContext context) {
    final _cast = context.select((ShowPageModel model) => model.credits!.cast);

    return Padding(
      padding: const EdgeInsets.symmetric(
        //vertical: PaddingConsts.screenVertical,
        horizontal: PaddingConsts.screenHorizontal,
      ),
      child: ListView.builder(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        itemCount: _cast.length,
        itemExtent: 100,
        itemBuilder: (BuildContext context, int index) {
          return _CastItemWidget(
            cast: _cast[index],
            handleCardTap: (int castId) => handleShowCastPage(context, castId),
          );
        },
      ),
    );
  }
}

class _CastItemWidget extends StatelessWidget {
  final Cast cast;
  final void Function(int) handleCardTap;

  const _CastItemWidget({
    Key? key,
    required this.cast,
    required this.handleCardTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _avatar = ModelUtils.getActorImage(cast.profilePath);
    final _character = ModelUtils.getCastCharacterName(cast.roles);

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      clipBehavior: Clip.hardEdge,
      decoration: WidgetThemeShelf.roundedCardTheme,
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 80,
                height: double.infinity,
                child: _avatar,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cast.originalName,
                        style: TextThemeShelf.itemTitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 3),
                      Text(
                        _character,
                        style: TextThemeShelf.main,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => handleCardTap(cast.id),
            ),
          ),
        ],
      ),
    );
  }
}
