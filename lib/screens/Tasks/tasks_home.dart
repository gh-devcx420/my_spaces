import 'package:flutter/material.dart';
import 'package:myspaces/utils/widgets.dart';
import 'package:myspaces/utils/ui_helper.dart';

import '../../utils/constants.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.5),
        elevation: 0,
        enableFeedback: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            margin: widget.ui.paddingSmall,
            //color: Colors.red.withOpacity(0.5),
            width: MediaQuery.of(context).size.width,
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
                widget.ui.verticalSpaceSmall(),
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
                        "Task List",
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
                widget.ui.verticalSpaceSmall(),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
