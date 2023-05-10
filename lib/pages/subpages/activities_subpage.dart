import 'package:app_master_class/datasource/activities_datasource.dart';
import 'package:app_master_class/model/group_activities_model.dart';
import 'package:app_master_class/widgets/group_activities_widget.dart';
import 'package:flutter/material.dart';

class ActivitiesSubPage extends StatelessWidget {
  ActivitiesSubPage({super.key});
  List<GroupActivitiesModel> groupsActivities =
      (activites['portifolio-activities'] as List<Map<String, dynamic>>)
          .map((group) => GroupActivitiesModel.fromMap(group))
          .toList();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: groupsActivities.length,
      itemBuilder: (contex, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 16),
          child:
              GroupActivitiesWidget(groupActivities: groupsActivities[index]),
        );
      },
    );
  }
}
