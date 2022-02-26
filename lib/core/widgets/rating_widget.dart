import 'package:flutter/material.dart';
import 'package:moovee_land/core/theme/colors_theme.dart';

enum MediaRatingColorTheme { light, dark }

class MediaRatingWidget extends StatelessWidget {
  final String rating;
  final MediaRatingColorTheme colorTheme;
  final double marginTop;

  const MediaRatingWidget({
    Key? key,
    required this.rating,
    this.colorTheme = MediaRatingColorTheme.dark,
    this.marginTop = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _background;
    Color _foreground;

    switch (colorTheme) {
      case MediaRatingColorTheme.light:
        _background = Colors.white;
        _foreground = ColorThemeShelf.blackForeground;
        break;
      case MediaRatingColorTheme.dark:
        _background = ColorThemeShelf.backgroundDark;
        _foreground = ColorThemeShelf.whiteForeground;
        break;
    }

    return Container(
      width: 60,
      height: 24,
      margin: EdgeInsets.only(top: marginTop),
      decoration: BoxDecoration(
        color: _background,
        borderRadius: const BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.star_rate_rounded,
              size: 14,
              color: _foreground,
            ),
            const SizedBox(width: 3),
            Text(
              rating,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: _foreground,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
