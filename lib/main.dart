import 'package:app_master_class/theme/theme_viewmodel.dart';
import 'package:flutter/material.dart';

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
        routes: Routes.getRoutes());
  }
}
