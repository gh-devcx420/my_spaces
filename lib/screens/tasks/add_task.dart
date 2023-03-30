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
                MSHeader(
                  headerTitle: 'Add Task',
                  ui: widget.ui,
                  enableSearch: false,
                  enableSave: true,
                  onActionButtonTap: () {
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
                widget.ui.verticalSpaceMedium(),
                MSTasksHeadingLabel(
                  ui: widget.ui,
                  name: "Task Name :",
                ),
                widget.ui.verticalSpaceSmall(),
                MSTextField(
                  ui: widget.ui,
                  prefixIcon: Icons.drive_file_rename_outline_rounded,
                  taskController: taskNameController,
                ),
                widget.ui.verticalSpaceMedium(),
                MSTasksHeadingLabel(
                  ui: widget.ui,
                  name: "Task Notes :",
                ),
                widget.ui.verticalSpaceSmall(),
                MSTextField(
                  ui: widget.ui,
                  prefixIcon: Icons.description,
                  taskController: taskDescriptionController,
                ),
                widget.ui.verticalSpaceMedium(),
                MSTasksHeadingLabel(
                  ui: widget.ui,
                  name: "Category :",
                ),
                widget.ui.verticalSpaceVerySmall(),
                Wrap(
                  children: [
                    MSIconTextChip(
                      ui: widget.ui,
                      chipTitle:
                          selectedChip == CategoryChips.casual ? "Casual" : "",
                      enableChipBorder:
                          selectedChip == CategoryChips.casual ? true : false,
                      chipIcon: Icons.emoji_people,
                      onChipTap: () {
                        setState(() {
                          selectedChip = CategoryChips.casual;
                        });
                      },
                    ),
                    MSIconTextChip(
                      ui: widget.ui,
                      chipTitle: selectedChip == CategoryChips.important
                          ? "Important"
                          : "",
                      chipIcon: Icons.label_important,
                      enableChipBorder: selectedChip == CategoryChips.important
                          ? true
                          : false,
                      onChipTap: () {
                        setState(() {
                          selectedChip = CategoryChips.important;
                        });
                      },
                    ),
                    MSIconTextChip(
                      ui: widget.ui,
                      chipTitle: selectedChip == CategoryChips.shopping
                          ? "Shopping"
                          : "",
                      chipIcon: Icons.shopping_cart,
                      enableChipBorder:
                          selectedChip == CategoryChips.shopping ? true : false,
                      onChipTap: () {
                        setState(() {
                          selectedChip = CategoryChips.shopping;
                        });
                      },
                    ),
                    MSIconTextChip(
                      ui: widget.ui,
                      chipTitle:
                          selectedChip == CategoryChips.studies ? "Study" : "",
                      chipIcon: Icons.collections_bookmark,
                      enableChipBorder:
                          selectedChip == CategoryChips.studies ? true : false,
                      onChipTap: () {
                        setState(() {
                          selectedChip = CategoryChips.studies;
                        });
                      },
                    ),
                    MSIconTextChip(
                      ui: widget.ui,
                      chipTitle: selectedChip == CategoryChips.exercise
                          ? "Exercise"
                          : "",
                      chipIcon: Icons.directions_run,
                      enableChipBorder:
                          selectedChip == CategoryChips.exercise ? true : false,
                      onChipTap: () {
                        setState(() {
                          selectedChip = CategoryChips.exercise;
                        });
                      },
                    ),
                    MSIconTextChip(
                      ui: widget.ui,
                      chipTitle:
                          selectedChip == CategoryChips.sports ? "Sports" : "",
                      chipIcon: Icons.sports_cricket,
                      enableChipBorder:
                          selectedChip == CategoryChips.sports ? true : false,
                      onChipTap: () {
                        setState(() {
                          selectedChip = CategoryChips.sports;
                        });
                      },
                    ),
                  ],
                ),
                widget.ui.verticalSpaceMedium(),
                MSTasksHeadingLabel(
                  ui: widget.ui,
                  name: "Priority :",
                ),
                widget.ui.verticalSpaceVerySmall(),
                Row(
                  children: [
                    MSTextChip(
                      ui: widget.ui,
                      chipText: priorityValue == Priority.low ? "Low" : "L",
                      borderColour: priorityValue == Priority.low
                          ? Theme.of(context).primaryColor.withOpacity(0.3)
                          : Colors.transparent,
                      onTap: () {
                        setState(() {
                          priorityValue = Priority.low;
                        });
                      },
                    ),
                    MSTextChip(
                      ui: widget.ui,
                      chipText:
                          priorityValue == Priority.medium ? "Medium" : "M",
                      borderColour: priorityValue == Priority.medium
                          ? Theme.of(context).primaryColor.withOpacity(0.3)
                          : Colors.transparent,
                      onTap: () {
                        setState(() {
                          priorityValue = Priority.medium;
                        });
                      },
                    ),
                    MSTextChip(
                      ui: widget.ui,
                      chipText: priorityValue == Priority.high ? "High" : "H",
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
                MSTasksHeadingLabel(
                  ui: widget.ui,
                  name: "Date :",
                ),
                widget.ui.verticalSpaceVerySmall(),
                MSIconTextChip(
                  ui: widget.ui,
                  chipIcon: Icons.calendar_month,
                  chipTitle: "30 Mar 2023",
                  enableChipBorder: false,
                  onChipTap: () {},
                ),
                widget.ui.verticalSpaceMedium(),
                MSTasksHeadingLabel(
                  ui: widget.ui,
                  name: "Time :",
                ),
                widget.ui.verticalSpaceVerySmall(),
                MSIconTextChip(
                  ui: widget.ui,
                  chipIcon: Icons.access_time_sharp,
                  chipTitle: "4:20 pm",
                  enableChipBorder: false,
                  onChipTap: () {},
                ),
                widget.ui.verticalSpaceMedium(),
                MSTasksHeadingLabel(
                  ui: widget.ui,
                  name: "Settings :",
                ),
                widget.ui.verticalSpaceVerySmall(),
                Row(
                  children: [
                    MSIconTextChip(
                      ui: widget.ui,
                      chipTitle: "Recurring Daily",
                      chipIcon: Icons.repeat,
                      enableChipBorder: false,
                      onChipTap: () {},
                    ),
                    MSIconTextChip(
                      ui: widget.ui,
                      chipTitle: "Notify At Selected Time",
                      chipIcon: Icons.notifications_outlined,
                      enableChipBorder: false,
                      onChipTap: () {},
                    ),
                  ],
                ),
                // widget.ui.verticalSpaceLarge(),
                // widget.ui.verticalSpaceLarge(),
                // widget.ui.verticalSpaceLarge(),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     widget.ui.horizontalSpaceVerySmall(),
                //     MySpacesTextButton(
                //       ui: widget.ui,
                //       buttonHeight: 40,
                //       buttonWidth: 80,
                //       buttonColour:
                //           Theme.of(context).primaryColor.withOpacity(0.04),
                //       textColour:
                //           Theme.of(context).primaryColor.withOpacity(0.6),
                //       buttonText: "Cancel",
                //       onButtonTap: () {
                //         Navigator.pop(context);
                //       },
                //     ),
                //     widget.ui.horizontalSpaceSmall(),
                //     MySpacesTextButton(
                //       ui: widget.ui,
                //       buttonHeight: 40,
                //       buttonWidth: 80,
                //       buttonColour:
                //           Theme.of(context).primaryColor.withOpacity(0.1),
                //       textColour: Theme.of(context).primaryColor,
                //       buttonText: "Save",
                //       onButtonTap: () {
                //         FirebaseFirestore.instance.collection("MySpaces").add({
                //           "TaskName": taskNameController.text,
                //           "TaskCategory": selectedChip.toString(),
                //           "TaskNotes": taskDescriptionController.text,
                //           "TaskPriority": priorityValue.toString(),
                //         });
                //         Navigator.pop(context);
                //         taskNameController.clear();
                //         taskDescriptionController.clear();
                //         selectedChip = CategoryChips.none;
                //         priorityValue = Priority.none;
                //       },
                //     ),
                //     widget.ui.horizontalSpaceMedium(),
                //   ],
                // ),
                // widget.ui.verticalSpaceSmall(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
