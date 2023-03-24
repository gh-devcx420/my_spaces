import 'package:flutter/material.dart';
import 'package:myspaces/utils/ui_helper.dart';
import 'package:myspaces/utils/widgets.dart';

import '../../utils/constants.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  UiHelper ui = UiHelper();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        margin: ui.paddingSmall,
        //color: Colors.lightGreenAccent,
        //height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            ui.verticalSpaceSmall(),
            MySpacesHeader(
              headerTitle: 'Settings',
              ui: ui,
              // alertTitle: 'What is My Spaces?',
              // alertBody1:
              //     'My Spaces is a productivity app, that hosts a variety of functions.',
              // alertBody2:
              //     'This is the My Spaces screen where you can find \'Modules\' that perform different functions.',
            ),
            ui.verticalSpaceMedium(),
            Container(
              padding: ui.paddingSmall,
              decoration: BoxDecoration(
                //color: kSecondaryColour.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  MySpacesSettingsTile(
                    ui: ui,
                    icon: Icons.color_lens,
                    text: "Change App Theme",
                  ),
                  ui.verticalSpaceSmall(),
                  MySpacesSettingsTile(
                    ui: ui,
                    icon: Icons.notifications,
                    text: "Notifications",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
