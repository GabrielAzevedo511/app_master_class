import 'package:app_master_class/utils/rotes_utils.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1, milliseconds: 500),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );
  Alignment align = Alignment.centerLeft;

  @override
  void initState() {
    super.initState();
    changePage(context);
    _controller.forward();
  }

  void changePage(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 100)).then((value) => setState(
          () {
            align = Alignment.center;
          },
        ));
    Future.delayed(const Duration(seconds: 2, milliseconds: 500)).then(
        (value) => Navigator.pushReplacementNamed(context, Routes.homePage));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: AnimatedAlign(
        duration: const Duration(seconds: 2),
        alignment: align,
        curve: Curves.bounceOut,
        child: FadeTransition(
            opacity: _animation,
            child: Image.asset('assets/images/masterclass_logo.png')),
      ),
    );
  }
}
