import 'package:app_master_class/model/group_activities_model.dart';
import 'package:app_master_class/pages/web_page.dart';
import 'package:app_master_class/theme/theme_viewmodel.dart';
import 'package:flutter/material.dart';

import 'pages/group_activities_page.dart';
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
      initialRoute: Routes.splashPage,
      debugShowCheckedModeBanner: false,
      routes: {
        Routes.splashPage: (context) => const SplashPage(),
        Routes.homePage: (context) => const HomePage(),
        Routes.webPage: (context) {
          final link = ModalRoute.of(context)!.settings.arguments as String;
          return WebPage(link: link);
        },
        Routes.groupActivitiesPage: (context) {
          final group = ModalRoute.of(context)!.settings.arguments
              as GroupActivitiesModel;
          return GroupActivitiesPage(groupActivitiesModel: group);
        }
      },
    );
  }
}
