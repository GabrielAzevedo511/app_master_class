import 'package:flutter/material.dart';

class ControlledCustomFloatingActionButton extends StatefulWidget {
  const ControlledCustomFloatingActionButton(
      {super.key, this.haveAppBar = false});
  final bool haveAppBar;
  @override
  State<ControlledCustomFloatingActionButton> createState() =>
      _ControlledCustomFloatingActionButtonState();
}

class _ControlledCustomFloatingActionButtonState
    extends State<ControlledCustomFloatingActionButton>
    with SingleTickerProviderStateMixin {
  bool isTop = false;
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
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
    final double width =
        Tween(begin: 80.0, end: 100.0).animate(animationController).value;
    final double borderRadius =
        Tween(begin: 40.0, end: 0.0).animate(animationController).value;
    final Alignment alignment =
        isTop ? Alignment.topCenter : Alignment.bottomRight;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: GestureDetector(
          onTap: () {
            setState(() {
              isTop = !isTop;
              isTop
                  ? animationController.forward()
                  : animationController.reverse();
            });
          },
          child: AnimatedAlign(
            duration: const Duration(seconds: 1),
            alignment: alignment,
            child: Container(
              height: 80,
              width: width,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(borderRadius)),
            ),
          ),
        ),
      ),
    );
  }
}
