import 'package:app_master_class/widgets/change_theme_widget.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Widget logoActivities() {
      return Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 4),
            child: Image.asset('assets/images/logo.png'),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Atividades',
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

    return Hero(
      tag: 'appBar',
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          logoActivities(),
          const Padding(
            padding: EdgeInsets.all(26),
            child: ChangeThemeWidget(),
          )
        ],
      ),
    );
  }
}
