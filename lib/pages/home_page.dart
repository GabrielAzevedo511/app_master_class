import 'package:app_master_class/pages/subpages/about_subpage.dart';
import 'package:app_master_class/pages/subpages/activities_subpage.dart';
import 'package:app_master_class/pages/subpages/repository_subpage.dart';
import 'package:app_master_class/widgets/app_bar_widget.dart';
import 'package:app_master_class/widgets/bottom_navigation_bar_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final PageController pageController = PageController();
  int currentPage = 0;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppBarWidget(
              indexPage: currentPage,
              isHomePage: true,
            ),
            Expanded(
                child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              children: [
                ActivitiesSubPage(),
                const RepositorySubPage(),
                AboutSubPage()
              ],
            )),
            BottomNavigationBarWidget(
              indexPage: currentPage,
              onTap: (newPage) {
                currentPage = newPage;
                pageController.animateToPage(newPage,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.linear);
              },
            )
          ],
        ),
      ),
    );
  }
}
