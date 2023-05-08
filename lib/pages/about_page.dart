import 'package:app_master_class/widgets/app_bar_widget.dart';
import 'package:app_master_class/widgets/bottom_navigation_bar_widget.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [AppBarWidget(), BottomNavigationBarWidget()],
        ),
      ),
    );
  }
}
