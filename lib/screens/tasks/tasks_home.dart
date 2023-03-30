import 'package:flutter/material.dart';
import 'package:myspaces/utils/widgets.dart';
import 'package:myspaces/utils/ui_helper.dart';
import 'package:myspaces/screens/tasks/add_task.dart';
import 'package:myspaces/screens/tasks/show_task_details.dart';

class TasksHome extends StatefulWidget {
  const TasksHome({Key? key, required this.ui}) : super(key: key);

  final UiHelper ui;

  @override
  State<TasksHome> createState() => _TasksHomeState();
}

class _TasksHomeState extends State<TasksHome> {
  List tasks = [

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: const Alignment(0.85, 0.95),
          children: [
            Container(
              margin: widget.ui.onlyPaddingVeryMedium,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  MySpacesHeader(
                    headerTitle: 'Tasks',
                    ui: widget.ui,
                    enableSearch: true,
                  ),
                  // widget.ui.verticalSpaceMedium(),
                  // SearchBar(ui: widget.ui),
                  // widget.ui.verticalSpaceMedium(),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     widget.ui.horizontalSpaceMedium(),
                  //     Text(
                  //       "All Tasks",
                  //       style: widget.ui.heading3Style.copyWith(
                  //         color: Theme.of(context).primaryColor,
                  //         fontSize: 14,
                  //       ),
                  //     ),
                  //     const Spacer(),
                  //     SortButton(ui: widget.ui),
                  //     widget.ui.horizontalSpaceSmall(),
                  //   ],
                  // ),
                  widget.ui.verticalSpaceMedium(),
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          widget.ui.verticalSpaceSmall(),
                      physics: const BouncingScrollPhysics(),
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        return TaskTile(
                          ui: widget.ui,
                          taskName: tasks[index][0],
                          taskDescription: tasks[index][1],
                          taskCategory: tasks[index][2],
                          onTileTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ShowTaskDetails(
                                  ui: widget.ui,
                                  taskName: tasks[index][0],
                                  taskDescription: tasks[index][1],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            MySpacesFAB(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddTask(
                      ui: widget.ui,
                      tasks: tasks,
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
