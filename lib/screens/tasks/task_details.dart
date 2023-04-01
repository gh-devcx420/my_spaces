import 'package:flutter/material.dart';
import 'package:myspaces/utils/constants.dart';
import 'package:myspaces/utils/widgets.dart';
import 'package:myspaces/utils/ui_helper.dart';

class ShowTaskDetails extends StatelessWidget {
  const ShowTaskDetails({
    super.key,
    required this.ui,
    required this.taskName,
    required this.taskDescription,
  });

  final UiHelper ui;
  final String taskName;
  final String taskDescription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: ui.allPaddingSmall,
          //color: Colors.red.withOpacity(0.5),
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MSHeader(
                  headerTitle: 'Task Details',
                  ui: ui,
                  enableSearch: false,
                  onActionButtonTap: () {},
                ),
                ui.verticalSpaceMedium(),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: ui.allPaddingMedium,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(kRadiusValue),
                  ),
                  child: Padding(
                    padding: ui.allPaddingVerySmall,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          taskName,
                          style: ui.heading2Style
                              .copyWith(color: Theme.of(context).primaryColor),
                        ),
                        ui.verticalSpaceMedium(),
                        Text(
                          taskDescription,
                          style: ui.heading2Style
                              .copyWith(color: Theme.of(context).primaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
