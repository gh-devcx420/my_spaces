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
      var snackBar = SnackBar(
        dismissDirection: DismissDirection.down,
        backgroundColor: Theme.of(context).primaryColor,
        duration: const Duration(seconds: 1),
        content: const Text("Deleted Successfully"),
        behavior: SnackBarBehavior.floating,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      updateListView();
    }
  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initDatabase();
    dbFuture.then((database) {
      Future<List<Task>> taskListFuture = databaseHelper.getTasks();
      taskListFuture.then((taskList) {
        setState(() {
          this.taskList = taskList;
          count = taskList.length;
        });
      });
    });
  }

  @override
  void initState() {
    super.initState();
    databaseHelper.initDatabase();
    updateListView();
  }

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
                    onSearchButtonTap: () {},
                  ),
                  widget.ui.verticalSpaceMedium(),
                  count == 0
                      ? Expanded(
                          child: Center(
                            child: Text(
                              "Your Task List is empty! \n Add tasks to see them here!",
                              textAlign: TextAlign.center,
                              style: widget.ui.heading2Style.copyWith(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        )
                      : Expanded(
                          child: ListView.separated(
                            separatorBuilder: (context, index) {
                              return widget.ui.verticalSpaceSmall();
                            },
                            physics: const BouncingScrollPhysics(),
                            itemCount: taskList.length,
                            itemBuilder: (context, index) {
                              Task task = taskList[index];
                              return MSTaskTile(
                                ui: widget.ui,
                                taskName: task.taskName,
                                taskNotes: task.taskNotes,
                                taskCategory: task.taskCategory,
                                onTileTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ShowTaskDetails(
                                        ui: widget.ui,
                                        taskName: task.taskName,
                                        taskDescription: task.taskNotes,
                                      ),
                                    ),
                                  );
                                },
                                onTileLongTap: () {
                                  _delete(context, task);
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
                      taskList: taskList,
                    ),
                  ),
                ).then((value) {
                  updateListView();
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
