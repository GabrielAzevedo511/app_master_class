import 'package:app_master_class/utils/assets_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget(
      {super.key, required this.indexPage, required this.onTap});
  final int indexPage;
  final Function(int) onTap;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isHomePage = indexPage == 0;
    final bool isRepoPage = indexPage == 1;
    final bool isAboutPage = indexPage == 2;
    final Alignment alignment = isHomePage
        ? Alignment.topLeft
        : isRepoPage
            ? Alignment.topCenter
            : Alignment.topRight;

    Widget buttonWidget(
        {required Widget content,
        required String buttonName,
        required Function() onPressed,
        required bool isSelected}) {
      return GestureDetector(
        onTap: isSelected ? null : onPressed,
        child: SizedBox(
          width: 80,
          child: Column(children: [
            SizedBox(
              height: 30,
              child: Center(
                  child: SizedBox(height: 24, width: 24, child: content)),
            ),
            Text(
              buttonName,
              style: theme.textTheme.titleSmall,
            )
          ]),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 8),
      child: Stack(
        children: [
          AnimatedAlign(
            alignment: alignment,
            duration: const Duration(milliseconds: 500),
            child: Container(
              height: 30,
              width: 80,
              decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buttonWidget(
                  buttonName: 'Atividades',
                  isSelected: isHomePage,
                  content: SvgPicture.asset(
                    AssetsUtils.icons.targetIcon,
                    width: 24,
                    height: 24,
                    color: theme.colorScheme.secondary,
                  ),
                  onPressed: () {
                    onTap(0);
                  }),
              Container(
                width: 1,
                height: 40,
                color: theme.colorScheme.onSurface,
              ),
              buttonWidget(
                  buttonName: 'Repositórios',
                  isSelected: isRepoPage,
                  content: SvgPicture.asset(
                    AssetsUtils.icons.githubIcon,
                    color: theme.colorScheme.secondary,
                    width: 24,
                    height: 24,
                  ),
                  onPressed: () {
                    onTap(1);
                  }),
              Container(
                width: 1,
                height: 40,
                color: theme.colorScheme.onSurface,
              ),
              buttonWidget(
                  buttonName: 'Sobre o dev',
                  isSelected: isAboutPage,
                  content: Icon(
                    Icons.person_rounded,
                    color: theme.colorScheme.secondary,
                    size: 24,
                  ),
                  onPressed: () {
                    onTap(2);
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
