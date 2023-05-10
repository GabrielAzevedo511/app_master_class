import 'package:app_master_class/main.dart';
import 'package:app_master_class/utils/assets_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChangeThemeWidget extends StatelessWidget {
  const ChangeThemeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.findAncestorStateOfType<MyAppState>()!;
    return GestureDetector(
      onTap: state.viewModel.changeTheme,
      child: SvgPicture.asset(
        AssetsUtils.icons.moonIcon,
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
