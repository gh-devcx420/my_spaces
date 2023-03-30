import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myspaces/utils/constants.dart';
import 'package:myspaces/utils/widgets.dart';
import 'package:myspaces/utils/ui_helper.dart';

class AddTask extends StatefulWidget {
  const AddTask({
    Key? key,
    required this.ui,
    required this.tasks,
  }) : super(key: key);

  final UiHelper ui;
  final List tasks;

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final taskNameController = TextEditingController();
  final taskDescriptionController = TextEditingController();
  CategoryChips selectedChip = CategoryChips.none;
  Priority priorityValue = Priority.none;

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
                  enableSearch: false,
                ),
                widget.ui.verticalSpaceMedium(),
                TasksInputFieldHeading(ui: widget.ui, name: "Task Name :"),
                widget.ui.verticalSpaceVerySmall(),
                MySpacesTextField(
                  ui: widget.ui,
                  prefixIcon: Icons.drive_file_rename_outline_rounded,
                  taskController: taskNameController,
                ),
                widget.ui.verticalSpaceMedium(),
                TasksInputFieldHeading(ui: widget.ui, name: "Task Notes :"),
                widget.ui.verticalSpaceVerySmall(),
                MySpacesTextField(
                  ui: widget.ui,
                  prefixIcon: Icons.description,
                  taskController: taskDescriptionController,
                ),
                widget.ui.verticalSpaceMedium(),
                TasksInputFieldHeading(ui: widget.ui, name: "Category :"),
                widget.ui.verticalSpaceVerySmall(),
                Wrap(
                  children: [
                    MySpacesChip(
                      ui: widget.ui,
                      chipTitle: "Casual",
                      chipIcon: Icons.emoji_people,
                      chipBorderColour: selectedChip == CategoryChips.casual
                          ? Theme.of(context).primaryColor.withOpacity(0.3)
                          : Colors.transparent,
                      onChipTap: () {
                        setState(() {
                          selectedChip = CategoryChips.casual;
                        });
                      },
                    ),
                    MySpacesChip(
                      ui: widget.ui,
                      chipTitle: "Important",
                      chipIcon: Icons.label_important,
                      chipBorderColour: selectedChip == CategoryChips.important
                          ? Theme.of(context).primaryColor.withOpacity(0.3)
                          : Colors.transparent,
                      onChipTap: () {
                        setState(() {
                          selectedChip = CategoryChips.important;
                        });
                      },
                    ),
                    MySpacesChip(
                      ui: widget.ui,
                      chipTitle: "Sports",
                      chipIcon: Icons.sports_cricket,
                      chipBorderColour: selectedChip == CategoryChips.sports
                          ? Theme.of(context).primaryColor.withOpacity(0.3)
                          : Colors.transparent,
                      onChipTap: () {
                        setState(() {
                          selectedChip = CategoryChips.sports;
                        });
                      },
                    ),
                    MySpacesChip(
                      ui: widget.ui,
                      chipTitle: "Studies",
                      chipIcon: Icons.menu_book_sharp,
                      chipBorderColour: selectedChip == CategoryChips.studies
                          ? Theme.of(context).primaryColor.withOpacity(0.3)
                          : Colors.transparent,
                      onChipTap: () {
                        setState(() {
                          selectedChip = CategoryChips.studies;
                        });
                      },
                    ),
                    MySpacesChip(
                      ui: widget.ui,
                      chipTitle: "Exercise",
                      chipIcon: Icons.directions_run,
                      chipBorderColour: selectedChip == CategoryChips.exercise
                          ? Theme.of(context).primaryColor.withOpacity(0.3)
                          : Colors.transparent,
                      onChipTap: () {
                        setState(() {
                          selectedChip = CategoryChips.exercise;
                        });
                      },
                    ),
                    MySpacesChip(
                      ui: widget.ui,
                      chipTitle: "Shopping",
                      chipIcon: Icons.shopping_cart,
                      chipBorderColour: selectedChip == CategoryChips.shopping
                          ? Theme.of(context).primaryColor.withOpacity(0.3)
                          : Colors.transparent,
                      onChipTap: () {
                        setState(() {
                          selectedChip = CategoryChips.shopping;
                        });
                      },
                    ),
                  ],
                ),
                widget.ui.verticalSpaceMedium(),
                TasksInputFieldHeading(ui: widget.ui, name: "Priority :"),
                widget.ui.verticalSpaceVerySmall(),
                Row(
                  children: [
                    widget.ui.horizontalSpaceSmall(),
                    PriorityTextIcon(
                      ui: widget.ui,
                      iconText: "Low",
                      borderColour: priorityValue == Priority.low
                          ? Theme.of(context).primaryColor.withOpacity(0.3)
                          : Colors.transparent,
                      onTap: () {
                        setState(() {
                          priorityValue = Priority.low;
                        });
                      },
                    ),
                    PriorityTextIcon(
                      ui: widget.ui,
                      iconText: "Medium",
                      borderColour: priorityValue == Priority.medium
                          ? Theme.of(context).primaryColor.withOpacity(0.3)
                          : Colors.transparent,
                      onTap: () {
                        setState(() {
                          priorityValue = Priority.medium;
                        });
                      },
                    ),
                    PriorityTextIcon(
                      ui: widget.ui,
                      iconText: "High",
                      borderColour: priorityValue == Priority.high
                          ? Theme.of(context).primaryColor.withOpacity(0.3)
                          : Colors.transparent,
                      onTap: () {
                        setState(() {
                          priorityValue = Priority.high;
                        });
                      },
                    ),
                    widget.ui.horizontalSpaceSmall(),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: priorityValue == Priority.high
                            ? kMySpacesRed
                            : priorityValue == Priority.medium
                                ? kMySpacesOrange
                                : kMySpacesGreen,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ],
                ),
                widget.ui.verticalSpaceMedium(),
                TasksInputFieldHeading(ui: widget.ui, name: "Date :"),
                widget.ui.verticalSpaceVerySmall(),
                SelectedDateTimeDisplay(ui: widget.ui),
                TasksInputFieldHeading(ui: widget.ui, name: "Time"),
                widget.ui.verticalSpaceVerySmall(),
                SelectedDateTimeDisplay(ui: widget.ui),
                widget.ui.verticalSpaceVerySmall(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MySpacesTextButton(
                      ui: widget.ui,
                      buttonHeight: 40,
                      buttonWidth: 80,
                      buttonColour: Colors.white.withOpacity(0.1),
                      buttonText: "Cancel",
                      onButtonTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    widget.ui.horizontalSpaceMedium(),
                    MySpacesTextButton(
                      ui: widget.ui,
                      buttonHeight: 40,
                      buttonWidth: 80,
                      buttonColour:
                          Theme.of(context).primaryColor.withOpacity(0.1),
                      buttonText: "Save",
                      onButtonTap: () {
                        FirebaseFirestore.instance.collection("MySpaces").add({
                          "TaskName": taskNameController.text,
                          "TaskCategory": selectedChip.toString(),
                          "TaskNotes": taskDescriptionController.text,
                          "TaskPriority": priorityValue.toString(),
                        });
                        Navigator.pop(context);
                        taskNameController.clear();
                        taskDescriptionController.clear();
                        selectedChip = CategoryChips.none;
                        priorityValue = Priority.none;
                      },
                    ),
                  ],
                ),
                widget.ui.verticalSpaceSmall(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
