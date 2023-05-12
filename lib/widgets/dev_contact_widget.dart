import 'package:app_master_class/model/dev_models/dev_contacts_model.dart';
import 'package:app_master_class/model/dev_models/dev_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class DevContactWidget extends StatelessWidget {
  const DevContactWidget({Key? key, required this.devModel}) : super(key: key);
  final DevModel devModel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Widget avatarWidget() {
      return Container(
        height: 120,
        width: 120,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              devModel.imageLink,
            ),
          ),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black, width: 4),
        ),
      );
    }

    Widget contactsWidget() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(devModel.contacts.length, (index) {
          final bool isLast = (devModel.contacts.length - 1) == index;
          final DevContactsModel contact = devModel.contacts[index];
          return Padding(
            padding: EdgeInsets.only(right: isLast ? 0 : 28),
            child: GestureDetector(
              onTap: () async {
                await launchUrl(Uri.parse(contact.link));
              },
              child: SvgPicture.asset(
                contact.iconLink,
                color: theme.colorScheme.secondary,
                height: 24,
              ),
            ),
          );
        }),
      );
    }

    return Container(
      width: double.infinity,
      height: 320,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
          color: theme.cardColor, borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const Expanded(flex: 1, child: SizedBox()),
          avatarWidget(),
          const Expanded(flex: 2, child: SizedBox()),
          Text(
            devModel.name,
            style: theme.textTheme.titleMedium,
          ),
          const Expanded(flex: 2, child: SizedBox()),
          Text(
            devModel.description,
            textAlign: TextAlign.center,
          ),
          const Expanded(flex: 3, child: SizedBox()),
          contactsWidget(),
          const Expanded(flex: 3, child: SizedBox()),
        ],
      ),
    );
  }
}
