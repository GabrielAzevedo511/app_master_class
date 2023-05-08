import 'package:app_master_class/utils/rotes_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final String? currentPageName = ModalRoute.of(context)!.settings.name;
    final bool isHomePage = currentPageName == HOME_PAGE;
    final bool isRepoPage = currentPageName == REPO_PAGE;
    final bool isAboutPage = currentPageName == ABOUT_PAGE;
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
        child: Column(children: [
          Container(
            height: 30,
            width: 60,
            decoration: BoxDecoration(
                color: isSelected ? theme.cardColor : null,
                borderRadius: BorderRadius.circular(20)),
            child:
                Center(child: SizedBox(height: 24, width: 24, child: content)),
          ),
          Text(
            buttonName,
            style: theme.textTheme.titleSmall,
          )
        ]),
      );
    }

    return Hero(
      tag: 'bottomNavigator',
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 8),
        child: Stack(
          children: [
            AnimatedAlign(
              alignment: alignment,
              duration: const Duration(seconds: 1),
              child: Container(
                height: 30,
                width: 30,
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
                      'assets/icons/target.svg',
                      width: 24,
                      height: 24,
                      color: theme.colorScheme.secondary,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed(HOME_PAGE);
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
                      'assets/icons/github.svg',
                      color: theme.colorScheme.secondary,
                      width: 24,
                      height: 24,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed(REPO_PAGE);
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
                      Navigator.of(context).pushReplacementNamed(ABOUT_PAGE);
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
