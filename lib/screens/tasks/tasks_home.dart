import 'package:flutter/material.dart';
import 'package:myspaces/utils/widgets.dart';
import 'package:myspaces/utils/ui_helper.dart';
import 'package:myspaces/screens/tasks/add_task.dart';
import 'package:myspaces/screens/tasks/task_details.dart';

class TasksHome extends StatefulWidget {
  const TasksHome({Key? key, required this.ui}) : super(key: key);

  final UiHelper ui;

  @override
  State<TasksHome> createState() => _TasksHomeState();
}

class _TasksHomeState extends State<TasksHome> {
  List tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              margin: widget.ui.onlyPaddingVeryMedium,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  MSHeader(
                    headerTitle: 'Tasks',
                    ui: widget.ui,
                    enableSearch: true,
                    onActionButtonTap: () {},
                  ),
                  widget.ui.verticalSpaceMedium(),
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          widget.ui.verticalSpaceSmall(),
                      physics: const BouncingScrollPhysics(),
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        return MSTaskTile(
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
            MSFAB(
              ui: widget.ui,
              icon: Icons.add,
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
