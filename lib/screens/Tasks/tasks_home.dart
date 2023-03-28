import 'package:flutter/material.dart';
import 'package:myspaces/screens/Tasks/add_task.dart';
import 'package:myspaces/utils/widgets.dart';
import 'package:myspaces/utils/ui_helper.dart';

class TasksHome extends StatefulWidget {
  const TasksHome({super.key, required this.ui});

  final UiHelper ui;

  @override
  State<TasksHome> createState() => _TasksHomeState();
}

class _TasksHomeState extends State<TasksHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: const Alignment(0.85, 0.95),
          children: [
            Container(
              //margin: widget.ui.paddingSmall,
              margin: widget.ui.onlyPaddingVeryMedium,
              //color: Colors.red.withOpacity(0.5),
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    MySpacesHeader(
                      headerTitle: 'Tasks',
                      ui: widget.ui,
                      // alertTitle: 'What is My Spaces?',
                      // alertBody1:
                      //     'My Spaces is a productivity app, that hosts a variety of functions.',
                      // alertBody2:
                      //     'This is the My Spaces screen where you can find \'Modules\' that perform different functions.',
                    ),
                    widget.ui.verticalSpaceMedium(),
                    SearchBar(ui: widget.ui),
                    widget.ui.verticalSpaceMedium(),
                    SizedBox(
                      height: 20,
                      //color: Colors.black,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          widget.ui.horizontalSpaceSmall(),
                          Text(
                            "All Tasks",
                            style: widget.ui.heading3Style.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontSize: 14,
                            ),
                          ),
                          const Spacer(),
                          SortButton(ui: widget.ui),
                          widget.ui.horizontalSpaceSmall(),
                        ],
                      ),
                    ),
                    widget.ui.verticalSpaceMedium(),
                    TaskTile(
                      ui: widget.ui,
                    ),
                    widget.ui.verticalSpaceVerySmall(),
                    TaskTile(
                      ui: widget.ui,
                    ),
                    widget.ui.verticalSpaceVerySmall(),
                    TaskTile(
                      ui: widget.ui,
                    ),
                    widget.ui.verticalSpaceVerySmall(),
                    TaskTile(
                      ui: widget.ui,
                    ),
                    widget.ui.verticalSpaceVerySmall(),
                    TaskTile(
                      ui: widget.ui,
                    ),
                    widget.ui.verticalSpaceVerySmall(),
                    TaskTile(
                      ui: widget.ui,
                    ),
                    widget.ui.verticalSpaceVerySmall(),
                    TaskTile(
                      ui: widget.ui,
                    ),
                    widget.ui.verticalSpaceVerySmall(),
                    TaskTile(
                      ui: widget.ui,
                    ),
                    widget.ui.verticalSpaceVerySmall(),
                    TaskTile(
                      ui: widget.ui,
                    ),
                    widget.ui.verticalSpaceVerySmall(),
                    TaskTile(
                      ui: widget.ui,
                    ),
                    widget.ui.verticalSpaceVerySmall(),
                    TaskTile(
                      ui: widget.ui,
                    ),
                    widget.ui.verticalSpaceVerySmall(),
                    TaskTile(
                      ui: widget.ui,
                    ),
                    widget.ui.verticalSpaceVerySmall(),
                  ],
                ),
              ),
            ),
            MySpacesButton(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddTask(
                      ui: widget.ui,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
