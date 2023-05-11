import 'package:app_master_class/model/group_activities_model.dart';
import 'package:app_master_class/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class GroupActivitiesPage extends StatelessWidget {
  const GroupActivitiesPage({super.key, required this.groupActivitiesModel});
  final GroupActivitiesModel groupActivitiesModel;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget activityTileWidget(int index) {
      return Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, bottom: 8),
        child: Container(
          height: 64,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
              color: theme.cardColor, borderRadius: BorderRadius.circular(30)),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 33,
                height: 33,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: theme.primaryColor, shape: BoxShape.circle),
                child: Text(
                  '${index + 1}',
                  style: theme.textTheme.titleMedium,
                ),
              ),
              Flexible(
                child: Text(
                  groupActivitiesModel.activities[index].name,
                  textAlign: TextAlign.end,
                  style: theme.textTheme.titleMedium,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return SafeArea(
        child: Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Column(
        children: [
          AppBarWidget(
            isHomePage: false,
            title: groupActivitiesModel.name,
          ),
          Expanded(
              child: ListView.builder(
            itemCount: groupActivitiesModel.activities.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {},
                child: activityTileWidget(index),
              );
            },
          ))
        ],
      ),
    ));
  }
}
