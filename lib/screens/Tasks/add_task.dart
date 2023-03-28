import 'package:flutter/material.dart';
import 'package:myspaces/utils/constants.dart';
import 'package:myspaces/utils/widgets.dart';
import 'package:myspaces/utils/ui_helper.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key, required this.ui});

  final UiHelper ui;

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: widget.ui.allPaddingSmall,
          //color: Colors.red.withOpacity(0.5),
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MySpacesHeader(
                  headerTitle: 'Add Task',
                  ui: widget.ui,
                  // alertTitle: 'What is My Spaces?',
                  // alertBody1:
                  //     'My Spaces is a productivity app, that hosts a variety of functions.',
                  // alertBody2:
                  //     'This is the My Spaces screen where you can find \'Modules\' that perform different functions.',
                ),
                widget.ui.verticalSpaceMedium(),
                TextField(
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
                      color: Theme.of(context).primaryColor.withOpacity(0.4),
                    ),
                    labelText: "Task Name",
                    labelStyle: widget.ui.heading3Style.copyWith(
                      fontSize: 15,
                      color: Theme.of(context).primaryColor.withOpacity(0.4),
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
                widget.ui.verticalSpaceSmall(),
                TextField(
                  cursorHeight: 22,
                  cursorColor: Theme.of(context).primaryColor.withOpacity(0.1),
                  decoration: InputDecoration(
                    // hintText: " Task Name",
                    // hintStyle: widget.ui.body3Style.copyWith(
                    //   color: Theme.of(context).primaryColor.withOpacity(0.4),
                    // ),
                    //helperText: "Helper",
                    prefixIcon: Icon(
                      Icons.description,
                      color: Theme.of(context).primaryColor.withOpacity(0.4),
                    ),
                    labelText: "Description",
                    labelStyle: widget.ui.heading3Style.copyWith(
                      fontSize: 15,
                      color: Theme.of(context).primaryColor.withOpacity(0.4),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
