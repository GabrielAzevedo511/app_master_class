import 'package:app_master_class/model/activity_model.dart';
import 'package:app_master_class/utils/activities_utils.dart';
import 'package:app_master_class/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key, required this.activityModel});
  final ActivityModel activityModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const AppBarWidget(
              isHomePage: false,
              title: 'Exercício',
            ),
            Expanded(
              child: ActivitiesUtils.getActivityByKey(activityModel.key),
            ),
          ],
        ),
      ),
    );
  }
}
