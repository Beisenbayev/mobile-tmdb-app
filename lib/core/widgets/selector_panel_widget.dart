import 'package:flutter/material.dart';
import 'package:moovee_land/core/theme/text_theme.dart';
import 'package:moovee_land/core/theme/widget_theme.dart';

class SelectorPanelWidget extends StatefulWidget {
  final List<String> items;
  final int selectedIndex;
  final void Function(int) handleSelectItem;

  const SelectorPanelWidget({
    Key? key,
    required this.items,
    required this.selectedIndex,
    required this.handleSelectItem,
  }) : super(key: key);

  @override
  State<SelectorPanelWidget> createState() => _SelectorPanelWidgetState();
}

class _SelectorPanelWidgetState extends State<SelectorPanelWidget> {
  bool _isOpend = false;

  void _toggleIsOpend() {
    setState(() => _isOpend = !_isOpend);
  }

  void _handleSelectItem(int index) {
    if (index == widget.selectedIndex) return;

    widget.handleSelectItem(index);
    _toggleIsOpend();
  }

  @override
  Widget build(BuildContext context) {
    final selectedTitle = widget.items[widget.selectedIndex];
    final icon = _isOpend
        ? Icons.keyboard_arrow_up_rounded
        : Icons.keyboard_arrow_down_rounded;

    return Column(
      children: [
        GestureDetector(
          onTap: _toggleIsOpend,
          child: Container(
            width: 150,
            padding: const EdgeInsets.symmetric(
              vertical: 3,
              horizontal: 6,
            ),
            decoration: WidgetThemeShelf.roundedCardTheme,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(selectedTitle, style: TextThemeShelf.main),
                ),
                Icon(icon),
              ],
            ),
          ),
        ),
        const SizedBox(height: 6),
        _isOpend
            ? Container(
                width: 150,
                height: (widget.items.length * 30) + 10,
                decoration: WidgetThemeShelf.roundedCardTheme,
                child: ListView.separated(
                  itemCount: widget.items.length,
                  itemBuilder: (BuildContext context, int index) {
                    final _title = widget.items[index];
                    final _selectedIcon = widget.selectedIndex == index
                        ? const Icon(Icons.done_rounded, size: 20)
                        : const SizedBox.shrink();

                    return GestureDetector(
                      onTap: () => _handleSelectItem(index),
                      child: Container(
                        height: 30,
                        padding: const EdgeInsets.symmetric(
                          vertical: 3,
                          horizontal: 6,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(_title, style: TextThemeShelf.main),
                            ),
                            _selectedIcon,
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(
                      height: 1,
                      color: Color.fromRGBO(200, 200, 200, 1),
                    );
                  },
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
