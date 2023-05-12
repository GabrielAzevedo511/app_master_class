import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatefulWidget {
  const CustomFloatingActionButton({super.key, this.haveAppBar = false});
  final bool haveAppBar;
  @override
  State<CustomFloatingActionButton> createState() =>
      _CustomFloatingActionButtonState();
}

class _CustomFloatingActionButtonState
    extends State<CustomFloatingActionButton> {
  bool isTop = false;

  @override
  Widget build(BuildContext context) {
    final double width = isTop ? 100 : 80;
    final double borderRadius = isTop ? 0 : 40;
    final Alignment alignment =
        isTop ? Alignment.topCenter : Alignment.bottomRight;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: GestureDetector(
          onTap: () {
            setState(() {
              isTop = !isTop;
            });
          },
          child: AnimatedAlign(
            duration: const Duration(seconds: 1),
            alignment: alignment,
            child: AnimatedContainer(
              duration: const Duration(seconds: 1),
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
