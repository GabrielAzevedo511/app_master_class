import 'package:app_master_class/model/group_activities_model.dart';
import 'package:app_master_class/utils/assets_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GroupActivitiesWidget extends StatelessWidget {
  const GroupActivitiesWidget({super.key, required this.groupActivities});
  final GroupActivitiesModel groupActivities;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Widget iconWidget() {
      return Container(
        height: 43,
        width: 43,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: theme.primaryColor,
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          groupActivities.imageLink,
          color: theme.cardColor,
        ),
      );
    }

    Widget titleCard() {
      return Row(
        children: [
          iconWidget(),
          const SizedBox(
            width: 16,
          ),
          Text(
            groupActivities.name,
            style: theme.textTheme.titleMedium,
          ),
          const Expanded(child: SizedBox()),
          const Text('Exercícios:'),
          const SizedBox(
            width: 10,
          ),
          Text(
            groupActivities.activities.length.toString(),
            style: theme.textTheme.titleSmall,
          )
        ],
      );
    }

    Widget githubButton() {
      return GestureDetector(
        onTap: () {
          // TODO colocar link
        },
        child: Row(
          children: [
            SvgPicture.asset(
              AssetsUtils.icons.githubIcon,
              height: 20,
              color: theme.colorScheme.secondary,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              'Acessar código fonte',
              style: theme.textTheme.titleSmall,
            ),
          ],
        ),
      );
    }

    Widget seeMoreButton() {
      return GestureDetector(
        onTap: () {},
        child: Container(
          width: 120,
          height: 35,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: theme.primaryColor,
              borderRadius: BorderRadius.circular(15)),
          child: Text(
            'Ver mais',
            style: theme.textTheme.titleSmall,
          ),
        ),
      );
    }

    Widget buttonsWidget() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [githubButton(), seeMoreButton()],
      );
    }

    return Container(
      height: 200,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          titleCard(),
          Text(groupActivities.description),
          buttonsWidget()
        ],
      ),
    );
  }
}
