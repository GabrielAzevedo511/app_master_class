import 'package:app_master_class/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatelessWidget {
  const WebPage({super.key, required this.link});
  final String link;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          children: [
            const AppBarWidget(
              title: 'FlutterandoWeb',
              isHomePage: false,
            ),
            Expanded(
                child: WebView(
              initialUrl: link,
            ))
          ],
        ),
      ),
    );
  }
}
