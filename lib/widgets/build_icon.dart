import 'package:material_ui/material_ui.dart';

import '../tab_item.dart';
import '../count_style.dart';

class BuildIcon extends StatelessWidget {
  final TabItem item;
  final double iconSize;
  final Color iconColor;
  final CountStyle? countStyle;

  const BuildIcon({
    Key? key,
    required this.item,
    required this.iconColor,
    this.iconSize = 22,
    this.countStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget iconWidget;
    if (item.icon is IconData) {
      iconWidget = Icon(
        item.icon,
        size: iconSize,
        semanticLabel: item.title,
        color: iconColor,
      );
    } else if (item.icon is Widget) {
      iconWidget = item.icon;
    } else {
      iconWidget = const SizedBox.shrink();
    }

    if (item.count is Widget) {
      double sizeBadge = countStyle?.size ?? 18;
      return Stack(
        clipBehavior: Clip.none,
        children: [
          iconWidget,
          PositionedDirectional(
            start: iconSize - sizeBadge / 2,
            top: -sizeBadge / 2,
            child: item.count!,
          ),
        ],
      );
    }
    return iconWidget;
  }
}
