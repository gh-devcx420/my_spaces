import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:myspaces/models/task.dart';
import 'package:myspaces/services/database_helper.dart';
import 'package:myspaces/utils/widgets.dart';
import 'package:myspaces/utils/constants.dart';
import 'package:myspaces/utils/ui_helper.dart';

class AddTask extends StatefulWidget {
  const AddTask({
    Key? key,
    required this.ui,
    required this.taskList,
  }) : super(key: key);

  final UiHelper ui;
  final List<Task> taskList;

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final taskNameController = TextEditingController();
  final taskNotesController = TextEditingController();
  Category selectedCategory = Category.none;
  String selectedCategoryChipTitle = "Category";
  IconData selectedCategoryChipIcon = Icons.category;
  Priority selectedPriority = Priority.none;
  String selectedPriorityChipTitle = "Priority";
  IconData selectedPriorityChipIcon = Icons.priority_high_sharp;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                margin: widget.ui.allPaddingSmall,
                //color: Colors.red.withOpacity(0.5),
                height: MediaQuery.of(context).size.height,
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
                        onSearchButtonTap: () {},
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
                        //todo : Dispose Keyboard on screen touch
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
                        taskController: taskNotesController,
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
                        chipTitle:
                            DateFormat('dd-MMM-yyyy').format(selectedDate),
                        enableChipBorder: false,
                        onTap: () {
                          showDatePicker(
                            context: context,
                            initialDate: selectedDate,
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2101),
                          ).then((pickedDate) {
                            if (pickedDate != null &&
                                pickedDate != selectedDate) {
                              setState(() {
                                selectedDate = pickedDate;
                              });
                            }
                          });
                        },
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
                        chipTitle: selectedTime.format(context).toString(),
                        enableChipBorder: false,
                        onTap: () {
                          showTimePicker(
                            context: context,
                            initialTime: selectedTime,
                          ).then((result) {
                            if (result != null) {
                              setState(() {
                                selectedTime = result;
                              });
                            }
                          });
                        },
                      ),
                      widget.ui.verticalSpaceMedium(),
                      MSTasksHeadingLabel(
                        ui: widget.ui,
                        name: "Settings :",
                      ),
                      widget.ui.verticalSpaceVerySmall(),
                      MSIconTextChip(
                        ui: widget.ui,
                        chipTitle: selectedCategoryChipTitle,
                        chipIcon: selectedCategoryChipIcon,
                        enableChipBorder: false,
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                elevation: 0,
                                //todo: update task category text in the dialogue and provide an ok button to pop the alert dialogue.
                                title: Text(
                                  'Select Task Category',
                                  style: widget.ui.msTasksHeadingLabelStyle
                                      .copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                content: Wrap(
                                  children: [
                                    MSIconChip(
                                      ui: widget.ui,
                                      enableChipBorder:
                                          selectedCategory == Category.none
                                              ? true
                                              : false,
                                      chipIcon: Icons.not_interested,
                                      onTap: () {
                                        setState(() {
                                          selectedCategory = Category.none;
                                          selectedCategoryChipTitle = "None";
                                          selectedCategoryChipIcon =
                                              Icons.not_interested;
                                        });
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    MSIconChip(
                                      ui: widget.ui,
                                      enableChipBorder:
                                          selectedCategory == Category.casual
                                              ? true
                                              : false,
                                      chipIcon: Icons.emoji_people,
                                      onTap: () {
                                        setState(() {
                                          selectedCategory = Category.casual;
                                          selectedCategoryChipTitle = "Casual";
                                          selectedCategoryChipIcon =
                                              Icons.emoji_people;
                                        });
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    MSIconChip(
                                      ui: widget.ui,
                                      chipIcon: Icons.label_important,
                                      enableChipBorder:
                                          selectedCategory == Category.important
                                              ? true
                                              : false,
                                      onTap: () {
                                        setState(() {
                                          selectedCategory = Category.important;
                                          selectedCategoryChipTitle =
                                              "Important";
                                          selectedCategoryChipIcon =
                                              Icons.label_important;
                                        });
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    MSIconChip(
                                      ui: widget.ui,
                                      chipIcon: Icons.shopping_cart,
                                      enableChipBorder:
                                          selectedCategory == Category.shopping
                                              ? true
                                              : false,
                                      onTap: () {
                                        setState(() {
                                          selectedCategory = Category.shopping;
                                          selectedCategoryChipTitle =
                                              "Shopping";
                                          selectedCategoryChipIcon =
                                              Icons.shopping_cart;
                                        });
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    MSIconChip(
                                      ui: widget.ui,
                                      chipIcon: Icons.collections_bookmark,
                                      enableChipBorder:
                                          selectedCategory == Category.studies
                                              ? true
                                              : false,
                                      onTap: () {
                                        setState(() {
                                          selectedCategory = Category.studies;
                                          selectedCategoryChipTitle = "Studies";
                                          selectedCategoryChipIcon =
                                              Icons.collections_bookmark;
                                        });
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    MSIconChip(
                                      ui: widget.ui,
                                      chipIcon: Icons.directions_run,
                                      enableChipBorder:
                                          selectedCategory == Category.exercise
                                              ? true
                                              : false,
                                      onTap: () {
                                        setState(() {
                                          selectedCategory = Category.exercise;
                                          selectedCategoryChipTitle =
                                              "Exercise";
                                          selectedCategoryChipIcon =
                                              Icons.directions_run;
                                        });
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    MSIconChip(
                                      ui: widget.ui,
                                      chipIcon: Icons.sports_cricket,
                                      enableChipBorder:
                                          selectedCategory == Category.sports
                                              ? true
                                              : false,
                                      onTap: () {
                                        setState(() {
                                          selectedCategory = Category.sports;
                                          selectedCategoryChipTitle = "Sports";
                                          selectedCategoryChipIcon =
                                              Icons.sports_cricket;
                                        });
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                ),
                                actions: [
                                  MaterialButton(
                                    child: Text(
                                      'Cancel',
                                      style: widget.ui.msTasksHeadingLabelStyle
                                          .copyWith(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                      MSIconTextChip(
                        ui: widget.ui,
                        chipTitle: selectedPriorityChipTitle,
                        chipIcon: selectedPriorityChipIcon,
                        enableChipBorder: false,
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                  "Priority",
                                  style: widget.ui.msTasksHeadingLabelStyle
                                      .copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                content: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    MSTextChip(
                                      ui: widget.ui,
                                      chipText: "Low",
                                      enableBorder:
                                          selectedPriority == Priority.low
                                              ? true
                                              : false,
                                      onTap: () {
                                        setState(() {
                                          selectedPriority = Priority.low;
                                          selectedPriorityChipTitle = "Low";
                                          selectedPriorityChipIcon =
                                              Icons.trending_down_sharp;
                                        });
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    widget.ui.horizontalSpaceVerySmall(),
                                    MSTextChip(
                                      ui: widget.ui,
                                      chipText: "Medium",
                                      enableBorder:
                                          selectedPriority == Priority.medium
                                              ? true
                                              : false,
                                      onTap: () {
                                        setState(() {
                                          selectedPriority = Priority.medium;
                                          selectedPriorityChipTitle = "Medium";
                                          selectedPriorityChipIcon =
                                              Icons.hourglass_bottom;
                                        });
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    widget.ui.horizontalSpaceVerySmall(),
                                    MSTextChip(
                                      ui: widget.ui,
                                      chipText: "High",
                                      enableBorder:
                                          selectedPriority == Priority.high
                                              ? true
                                              : false,
                                      onTap: () {
                                        setState(() {
                                          selectedPriority = Priority.high;
                                          selectedPriorityChipTitle = "High";
                                          selectedPriorityChipIcon =
                                              Icons.trending_up_sharp;
                                        });
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                ),
                                actions: <Widget>[
                                  MaterialButton(
                                    child: Text(
                                      "Cancel",
                                      style: widget.ui.msTasksHeadingLabelStyle
                                          .copyWith(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: widget.ui.allPaddingMedium,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    widget.ui.horizontalSpaceVerySmall(),
                    MySpacesTextButton(
                      ui: widget.ui,
                      buttonHeight: 40,
                      buttonWidth: 80,
                      buttonColour:
                          Theme.of(context).primaryColor.withOpacity(0.04),
                      textColour:
                          Theme.of(context).primaryColor.withOpacity(0.6),
                      buttonText: "Cancel",
                      onButtonTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    widget.ui.horizontalSpaceSmall(),
                    MySpacesTextButton(
                        ui: widget.ui,
                        buttonHeight: 40,
                        buttonWidth: 80,
                        buttonColour:
                            Theme.of(context).primaryColor.withOpacity(0.1),
                        textColour: Theme.of(context).primaryColor,
                        buttonText: "Save",
                        onButtonTap: () async {
                          final now = DateTime.now();
                          final selectedDateTime = DateTime(
                            selectedDate.year,
                            selectedDate.month,
                            selectedDate.day,
                            selectedTime.hour,
                            selectedTime.minute,
                          );
                          final scaffoldContext = context;
                          if (taskNameController.text == '' ||
                              taskNotesController.text == '' ||
                              selectedDateTime.isBefore(now)) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Error'),
                                  content: const Text(
                                      'Please check the inputs and try again!'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          } else {
                            String taskTimeAsString =
                                selectedTime.format(context).toString();
                            String taskDateAsString =
                                DateFormat('dd-MMM-yyyy').format(selectedDate);

                            Task task = Task(
                              taskName: taskNameController.text,
                              taskNotes: taskNotesController.text,
                              taskDate: taskDateAsString,
                              taskTime: taskTimeAsString,
                              taskCategory: selectedCategory,
                              taskPriority: selectedPriority,
                            );

                            // Insert the task into the database
                            DatabaseHelper databaseHelper = DatabaseHelper();
                            int taskId = await databaseHelper.insertTask(task);
                            if (taskId > 0) {
                              print("Task inserted with ID: $taskId");
                            } else {
                              print("Failed to insert task");
                            }

                            taskNameController.clear();
                            taskNotesController.clear();
                            selectedCategory = Category.none;
                            selectedPriority = Priority.none;
                            selectedDate = DateTime.now();
                            selectedTime = TimeOfDay.now();
                            Navigator.pop(scaffoldContext);
                          }
                        }),
                    widget.ui.horizontalSpaceSmall(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
