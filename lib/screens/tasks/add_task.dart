import 'package:flutter/material.dart';
import 'package:myspaces/screens/Tasks/tasks_home.dart';
import 'package:myspaces/utils/constants.dart';
import 'package:myspaces/utils/widgets.dart';
import 'package:myspaces/utils/ui_helper.dart';

class AddTask extends StatelessWidget {
  const AddTask({
    super.key,
    required this.ui,
    required this.taskNameController,
    required this.taskDescriptionController,
    required this.onSave,
  });

  final UiHelper ui;
  final taskNameController;
  final taskDescriptionController;
  final Function() onSave;

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
                MySpacesHeader(
                  headerTitle: 'Add Task',
                  ui: ui,
                  enableSearch: false,
                   ),
                ui.verticalSpaceMedium(),
                TextField(
                  controller: taskNameController,
                  cursorHeight: 22,
                  cursorColor: Theme.of(context).primaryColor.withOpacity(0.1),
                  decoration: InputDecoration(
                    // hintText: " Task Name",
                    // hintStyle: widget.ui.body3Style.copyWith(
                    //   color: Theme.of(context).primaryColor.withOpacity(0.4),
                    // ),
                    //helperText: "Helper",
                    prefixIcon: Icon(
                      Icons.drive_file_rename_outline_rounded,
                      color: Theme.of(context).primaryColor.withOpacity(0.6),
                    ),
                    labelText: "Task Name",
                    labelStyle: ui.heading3Style.copyWith(
                      fontSize: 15,
                      color: Theme.of(context).primaryColor.withOpacity(0.6),
                    ),
                    filled: true,
                    fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(kRadiusValue),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor.withOpacity(0.3),
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(kRadiusValue),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                ui.verticalSpaceSmall(),
                TextField(
                  controller: taskDescriptionController,
                  cursorHeight: 22,
                  cursorColor: Theme.of(context).primaryColor.withOpacity(0.1),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.description,
                      color: Theme.of(context).primaryColor.withOpacity(0.6),
                    ),
                    labelText: "Description",
                    labelStyle: ui.heading3Style.copyWith(
                      fontSize: 15,
                      color: Theme.of(context).primaryColor.withOpacity(0.6),
                    ),
                    filled: true,
                    fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(kRadiusValue),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor.withOpacity(0.3),
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(kRadiusValue),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                ui.verticalSpaceSmall(),
                MySpacesButton(
                  onTap: onSave,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
