import 'package:app_master_class/utils/activities/anim/expanded_tile/controlled_custom_expanded_tile.widget%20.dart';
import 'package:app_master_class/utils/activities/anim/expanded_tile/custom_expanded_tile.widget.dart';
import 'package:flutter/material.dart';

const String loren =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam quis risus vel dolor ultricies porttitor. Nam a cursus magna. Nunc elementum lacinia mauris vel consectetur. Quisque dui sapien, tempus non arcu ut, mattis dignissim ipsum. Morbi sodales pulvinar nunc, eu elementum elit condimentum id. Vivamus a gravida sapien, sit amet lacinia erat. Nam faucibus vitae erat sit amet aliquet. Quisque dignissim felis sit amet eros tincidunt iaculis. Integer ullamcorper nisl eget cursus fermentum. Vestibulum commodo, nulla a finibus molestie, libero tortor finibus libero, sed finibus metus tellus ut neque.';

class MyScrollView extends StatefulWidget {
  const MyScrollView({super.key, required this.isControlled});
  final bool isControlled;

  @override
  State<MyScrollView> createState() => _MyScrollViewState();
}

class _MyScrollViewState extends State<MyScrollView> {
  int tileExpanded = -1;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 50,
      itemBuilder: ((context, index) {
        return widget.isControlled
            ? ControlledCustomExpandedTileWidget(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    FlutterLogo(size: 80),
                    Flexible(
                      child: Text(
                        loren,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  setState(() {
                    if (tileExpanded == index) {
                      tileExpanded = -1;
                    } else {
                      tileExpanded = index;
                    }
                  });
                },
                title: 'Custom Expanded Tile $index',
                isExpanded: index == tileExpanded,
              )
            : CustomExpandedTileWidget(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    FlutterLogo(size: 80),
                    Flexible(
                      child: Text(
                        loren,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  setState(() {
                    if (tileExpanded == index) {
                      tileExpanded = -1;
                    } else {
                      tileExpanded = index;
                    }
                  });
                },
                title: 'Custom Expanded Tile $index',
                isExpanded: index == tileExpanded,
              );
      }),
    );
  }
}
