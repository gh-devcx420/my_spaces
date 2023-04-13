import 'package:flutter/material.dart';
import 'package:myspaces/models/task.dart';
import 'package:myspaces/utils/widgets.dart';
import 'package:myspaces/utils/ui_helper.dart';
import 'package:myspaces/screens/tasks/add_task.dart';
import 'package:myspaces/services/database_helper.dart';
import 'package:myspaces/screens/tasks/task_details.dart';
import 'package:sqflite/sqflite.dart';

class TasksHome extends StatefulWidget {
  const TasksHome({Key? key, required this.ui}) : super(key: key);

  final UiHelper ui;

  @override
  State<TasksHome> createState() => _TasksHomeState();
}

class _TasksHomeState extends State<TasksHome> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Task> taskList = [];
  int count = 0;

  void _delete(BuildContext context, Task task) async {
    int result = await databaseHelper.deleteTask(task.id);
    if (result != 0) {
      //todo: Show SnackBar
      const snackBar = SnackBar(
        content: Text("Deleted Successfully"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      updateListView();
    }
  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Task>> taskListFuture = databaseHelper.getTaskList();
      taskListFuture.then((taskList) {
        setState(() {
          this.taskList = taskList;
          count = taskList.length;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (taskList == null) {
      taskList = <Task>[];
      updateListView();
    }
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
                    onSearchButtonTap: () {},
                  ),
                  widget.ui.verticalSpaceMedium(),
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          widget.ui.verticalSpaceSmall(),
                      physics: const BouncingScrollPhysics(),
                      itemCount: taskList.length,
                      itemBuilder: (context, index) {
                        return MSTaskTile(
                            ui: widget.ui,
                            taskName: taskList[index].taskName,
                            taskNotes: taskList[index].taskNotes,
                            taskCategory: taskList[index].taskCategory,
                            onTileTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ShowTaskDetails(
                                    ui: widget.ui, taskName: '', taskDescription: '',

                                  ),
                                ),
                              );
                            },
                            onTileLongTap: () {
                              setState(() {
                                _delete(context, taskList[index]);
                              });
                            });
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
