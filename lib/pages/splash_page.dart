import 'package:app_master_class/utils/rotes_utils.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    changePage(context);
  }

  void changePage(BuildContext context) {
    Future.delayed(const Duration(seconds: 2))
        .then((value) => Navigator.pushReplacementNamed(context, HOME_PAGE));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: Center(
        child: Image.asset('assets/images/masterclass_logo.png'),
      ),
    );
  }
}
