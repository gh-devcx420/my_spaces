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
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        margin: ui.allPaddingSmall,
        //color: Colors.red,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            MSHeader(
              headerTitle: 'Dashboard',
              ui: ui,
              enableSearch: false,
              enableSave: false,
              onActionButtonTap: (){},
            ),
            ui.verticalSpaceMedium(),
            MSDashboardCard(
              ui: ui,
              cardName: "Tasks Insights",
            ),ui.verticalSpaceSmall(),
            MSDashboardCard(
              ui: ui,
              cardName: "Journal Insights",
            ),ui.verticalSpaceMedium(),
            MSDashboardCard(
              ui: ui,
              cardName: "Tasks Insights",
            ),ui.verticalSpaceSmall(),
            MSDashboardCard(
              ui: ui,
              cardName: "Journal Insights",
            ),ui.verticalSpaceMedium(),
            MSDashboardCard(
              ui: ui,
              cardName: "Tasks Insights",
            ),ui.verticalSpaceSmall(),
            MSDashboardCard(
              ui: ui,
              cardName: "Journal Insights",
            ),ui.verticalSpaceMedium(),
            MSDashboardCard(
              ui: ui,
              cardName: "Tasks Insights",
            ),ui.verticalSpaceSmall(),
            MSDashboardCard(
              ui: ui,
              cardName: "Journal Insights",
            ),
          ],
        ),
      ),
    );
  }
}
