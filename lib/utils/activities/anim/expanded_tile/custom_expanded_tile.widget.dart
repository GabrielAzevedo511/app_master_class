import 'package:flutter/material.dart';

class CustomExpandedTileWidget extends StatelessWidget {
  /// Callback function that is triggered when the expanded
  /// tile is pressed.
  final Function onTap;

  /// The title that is displayed when the tile is in its collapsed state.
  final String title;

  /// This method is called when the widget is clicked and will trigger
  /// the expansion animation until it reaches the size of the content.
  /// If you need to have a fixed size, you must wrap your content
  /// with a widget that enforces a fixed size.
  final Widget content;

  /// This property allows you to change the state of the expandable tile.
  final bool isExpanded;

  /// The duration of the animation when the widget expands or collapses.
  final Duration animationDuration;

  /// The color of the title text.
  final Color titleColor;

  /// This widget creates an expandable tile that displays a title when idle,
  /// and expands to show the content when clicked.
  const CustomExpandedTileWidget({
    Key? key,
    required this.onTap,
    required this.title,
    required this.content,
    required this.isExpanded,
    this.titleColor = Colors.blue,
    this.animationDuration = const Duration(seconds: 1),
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double heightFactor = isExpanded ? 1 : 0;
    final double turnsIcon = isExpanded ? 1.25 : .75;
    final FontWeight fontWeight =
        isExpanded ? FontWeight.bold : FontWeight.normal;
    final Color color =
        isExpanded ? titleColor : Theme.of(context).colorScheme.secondary;

    Widget titleWidget() {
      return Container(
        color: Theme.of(context).backgroundColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              AnimatedDefaultTextStyle(
                duration: animationDuration,
                style: TextStyle(
                    color: color, fontWeight: fontWeight, fontSize: 18),
                child: Text(title),
              ),
              AnimatedRotation(
                turns: turnsIcon,
                duration: animationDuration,
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget contentWidget() {
      return ClipRect(
        child: AnimatedAlign(
          duration: animationDuration,
          alignment: Alignment.center,
          heightFactor: heightFactor,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: content,
          ),
        ),
      );
    }

    return Column(
      children: [
        const Divider(height: 1, color: Colors.grey, thickness: 2),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              InkWell(
                  onTap: () {
                    onTap();
                  },
                  child: titleWidget()),
              contentWidget(),
            ],
          ),
        ),
      ],
    );
  }
}
