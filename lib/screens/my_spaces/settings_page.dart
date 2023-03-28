import 'package:flutter/material.dart';
import 'package:myspaces/utils/widgets.dart';
import 'package:myspaces/utils/ui_helper.dart';

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
        margin: ui.allPaddingSmall,
        //color: Colors.lightGreenAccent,
        //height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
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
            Column(
              children: [
                MySpacesSettingsTile(
                  ui: ui,
                  icon: Icons.notifications,
                  text: "Notifications",
                ),
                ui.verticalSpaceSmall(),
                MySpacesSettingsTile(
                  ui: ui,
                  icon: Icons.color_lens,
                  text: "Select Theme",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
