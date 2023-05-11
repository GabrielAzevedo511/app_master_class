import 'package:app_master_class/widgets/change_theme_widget.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget(
      {super.key, this.indexPage, required this.isHomePage, this.title})
      : assert(
            isHomePage == false && title != null ||
                isHomePage && indexPage != null,
            'title must not be null when isHomePage != true or isHomePage need to be true and indexPage different of null');
  final int? indexPage;
  final bool isHomePage;
  final String? title;

  @override
  Widget build(BuildContext context) {
    String titleByIndex() {
      switch (indexPage) {
        case 1:
          return 'Repositórios';
        case 2:
          return 'Sobre o Dev';
        default:
          return 'Atividades';
      }
    }

    Widget logoActivities() {
      return Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 4),
            child: isHomePage
                ? Image.asset('assets/images/logo.png')
                : IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Theme.of(context).colorScheme.secondary,
                    )),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isHomePage ? titleByIndex() : title!,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'Flutterando Masterclass',
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.titleSmall,
              )
            ],
          )
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        logoActivities(),
        const Padding(
          padding: EdgeInsets.all(26),
          child: ChangeThemeWidget(),
        )
      ],
    );
  }
}
