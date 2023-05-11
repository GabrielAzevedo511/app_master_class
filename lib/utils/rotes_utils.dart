import 'package:app_master_class/model/activity_model.dart';
import 'package:app_master_class/model/group_activities_model.dart';
import 'package:app_master_class/pages/activity_page.dart';
import 'package:app_master_class/pages/group_activities_page.dart';
import 'package:app_master_class/pages/home_page.dart';
import 'package:app_master_class/pages/splash_page.dart';
import 'package:app_master_class/pages/web_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static const splashPage = '/splash';
  static const homePage = '/';
  static const webPage = '/webPage';
  static const groupActivitiesPage = '/groupActivitiesPage';
  static const activityPage = '/activityPage';

  static Map<String, Widget Function(BuildContext)> getRoutes() {
    return {
      Routes.splashPage: (context) => const SplashPage(),
      Routes.homePage: (context) => const HomePage(),
      Routes.webPage: (context) {
        final link = ModalRoute.of(context)!.settings.arguments as String;
        return WebPage(link: link);
      },
      Routes.groupActivitiesPage: (context) {
        final group =
            ModalRoute.of(context)!.settings.arguments as GroupActivitiesModel;
        return GroupActivitiesPage(groupActivitiesModel: group);
      },
      Routes.activityPage: (context) {
        final activity =
            ModalRoute.of(context)!.settings.arguments as ActivityModel;
        return ActivityPage(activityModel: activity);
      }
    };
  }
}
