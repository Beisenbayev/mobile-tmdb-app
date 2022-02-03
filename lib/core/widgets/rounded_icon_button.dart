import 'package:flutter/material.dart';
import 'package:moovee_land/core/theme/colors_theme.dart';

class RoundedIconButton extends StatelessWidget {
  final Icon icon;
  final Color color;
  final void Function() onTap;

  const RoundedIconButton({
    Key? key,
    required this.icon,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(100)),
        color: ColorThemeShelf.mainBackground,
      ),
      child: Center(
        child: IconButton(
          iconSize: 18,
          padding: const EdgeInsets.all(0),
          color: color,
          splashRadius: 15,
          onPressed: onTap,
          icon: icon,
        ),
      ),
    );
  }
}
