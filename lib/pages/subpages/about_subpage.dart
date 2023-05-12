import 'package:app_master_class/datasource/user_datasource.dart';
import 'package:app_master_class/model/dev_models/dev_model.dart';
import 'package:app_master_class/widgets/dev_contact_widget.dart';
import 'package:app_master_class/widgets/dev_technologies_widget.dart';
import 'package:flutter/material.dart';

class AboutSubPage extends StatelessWidget {
  AboutSubPage({super.key});
  final DevModel devModel = DevModel.fromMap(user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DevContactWidget(
                devModel: devModel,
              ),
              const SizedBox(
                height: 20,
              ),
              DevTechnologiesWidget(
                devModel: devModel,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
