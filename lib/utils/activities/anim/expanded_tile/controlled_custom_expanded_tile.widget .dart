import 'package:flutter/material.dart';

class ControlledCustomExpandedTileWidget extends StatefulWidget {
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
  const ControlledCustomExpandedTileWidget({
    Key? key,
    required this.onTap,
    required this.title,
    required this.content,
    required this.isExpanded,
    this.titleColor = Colors.blue,
    this.animationDuration = const Duration(seconds: 1),
  }) : super(key: key);

  @override
  State<ControlledCustomExpandedTileWidget> createState() =>
      _ControlledCustomExpandedTileWidgetState();
}

class _ControlledCustomExpandedTileWidgetState
    extends State<ControlledCustomExpandedTileWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: widget.animationDuration);
    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double turnsIcon = widget.isExpanded ? 1.25 : .75;
    final heightFactor = Tween(begin: 0.0, end: 1.0)
        .animate(
          CurvedAnimation(
            parent: animationController,
            curve: Curves.slowMiddle,
            reverseCurve: Curves.decelerate,
          ),
        )
        .value;
    final textStyle = TextStyleTween(
      begin: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
          fontWeight: FontWeight.normal,
          fontSize: 18),
      end: TextStyle(
          color: widget.titleColor, fontWeight: FontWeight.bold, fontSize: 18),
    )
        .animate(
          CurvedAnimation(
            parent: animationController,
            curve: Curves.linear,
            reverseCurve: Curves.linear,
          ),
        )
        .value;

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
                duration: widget.animationDuration,
                style: textStyle,
                child: Text(widget.title),
              ),
              AnimatedRotation(
                turns: turnsIcon,
                duration: widget.animationDuration,
                curve: Curves.slowMiddle,
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
        child: Align(
          alignment: Alignment.center,
          heightFactor: heightFactor,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: widget.content,
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
                    widget.isExpanded
                        ? animationController.reverse()
                        : animationController.forward();
                    widget.onTap();
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
