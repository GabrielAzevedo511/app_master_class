import 'package:app_master_class/pages/about_page.dart';
import 'package:app_master_class/pages/repository_page.dart';
import 'package:app_master_class/theme/theme_viewmodel.dart';
import 'package:flutter/material.dart';

import 'pages/home_page.dart';
import 'pages/splash_page.dart';
import 'theme/theme.dart';
import 'utils/rotes_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  ThemeViewModel viewModel = ThemeViewModel(ThemeMode.dark);
  @override
  void initState() {
    super.initState();
    viewModel.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: viewModel.theme,
      initialRoute: SPLASH_PAGE,
      debugShowCheckedModeBanner: false,
      routes: {
        SPLASH_PAGE: (context) => const SplashPage(),
        HOME_PAGE: (context) => const HomePage(),
        REPO_PAGE: (context) => const RepositoryPage(),
        ABOUT_PAGE: (context) => const AboutPage(),
      },
    );
  }
}
