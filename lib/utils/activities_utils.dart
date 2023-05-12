import 'package:app_master_class/utils/activities/anim/expanded_tile/my_scroll_view.page.dart';
import 'package:app_master_class/utils/activities/anim/floating_action_button/controlled_custom_floating_action_button.widget.dart';
import 'package:app_master_class/utils/activities/anim/floating_action_button/custom_floating_action_button.widget.dart';
import 'package:flutter/material.dart';

class ActivitiesUtils {
  static Widget getActivityByKey(String key) {
    switch (key) {
      case 'anim01':
        return const CustomFloatingActionButton();
      case 'anim02':
        return const MyScrollView(
          isControlled: false,
        );
      case 'anim03':
        return const ControlledCustomFloatingActionButton();
      case 'anim04':
        return const MyScrollView(
          isControlled: true,
        );
      default:
        return Container(
          color: Colors.red,
        );
    }
  }
}
