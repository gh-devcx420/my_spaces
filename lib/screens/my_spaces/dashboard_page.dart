import 'package:flutter/material.dart';
import 'package:myspaces/utils/ui_helper.dart';
import 'package:myspaces/utils/widgets.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  UiHelper ui = UiHelper();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: ui.paddingSmall,
      //color: Colors.red,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          MySpacesHeader(
            headerTitle: 'Dashboard',
            ui: ui,
            // alertTitle: 'What is My Spaces?',
            // alertBody1:
            //     'My Spaces is a productivity app, that hosts a variety of functions.',
            // alertBody2:
            //     'This is the My Spaces screen where you can find \'Modules\' that perform different functions.',
          ),
          ui.verticalSpaceMedium(),
          DashboardCard(
            ui: ui,
            cardName: "Tasks Insights",
          ),ui.verticalSpaceSmall(),
          DashboardCard(
            ui: ui,
            cardName: "Journal Insights",
          ),
        ],
      ),
    );
  }
}
