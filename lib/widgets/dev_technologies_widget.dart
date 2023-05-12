import 'package:app_master_class/model/dev_models/dev_model.dart';
import 'package:app_master_class/model/dev_models/dev_technologies_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DevTechnologiesWidget extends StatelessWidget {
  const DevTechnologiesWidget({super.key, required this.devModel});
  final DevModel devModel;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget favoriteTechnologiesWidget() {
      return SizedBox(
        height: 120,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: devModel.getFavoriteTechnologies().length,
          itemBuilder: (context, index) {
            final DevTechnologiesModel technology =
                devModel.getFavoriteTechnologies()[index];
            return Container(
              width: 100,
              height: 100,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(technology.iconLink, height: 50),
                  Text(
                    technology.name,
                    style: theme.textTheme.titleMedium,
                  )
                ],
              ),
            );
          },
        ),
      );
    }

    Widget abilityBar({required int ability, required double height}) {
      return LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Container(
                width: constraints.maxWidth,
                height: height,
                decoration: BoxDecoration(
                    color: theme.backgroundColor,
                    borderRadius: BorderRadius.circular(height / 2)),
              ),
              Container(
                width: (constraints.maxWidth * ability) / 100,
                height: height,
                decoration: BoxDecoration(
                    color: theme.primaryColor,
                    borderRadius: BorderRadius.circular(height / 2)),
              ),
            ],
          );
        },
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            'Tecnologias Favoritas',
            textAlign: TextAlign.start,
            style: theme.textTheme.titleMedium,
          ),
        ),
        favoriteTechnologiesWidget(),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            'Habilidades e Competências',
            textAlign: TextAlign.start,
            style: theme.textTheme.titleMedium,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 15),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: theme.cardColor, borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: List.generate(devModel.technologies.length, (index) {
              final DevTechnologiesModel technology =
                  devModel.technologies[index];
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(technology.name),
                  SizedBox(
                      width: 250,
                      child: abilityBar(
                        ability: technology.ability,
                        height: 10,
                      )),
                ],
              );
            }),
          ),
        )
      ],
    );
  }
}
