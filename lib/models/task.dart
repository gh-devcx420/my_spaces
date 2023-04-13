import 'package:flutter/material.dart';
import 'package:myspaces/utils/constants.dart';

class Task {
  int? id;
  String taskName;
  String taskNotes;
  DateTime taskDate;
  TimeOfDay taskTime;
  Category taskCategory;
  Priority taskPriority;

  Task({
    this.id,
    required this.taskName,
    required this.taskNotes,
    required this.taskDate,
    required this.taskTime,
    required this.taskCategory,
    required this.taskPriority,
  });


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'taskName': taskName,
      'taskNotes': taskNotes,
      'taskDate': taskDate.toString(),
      'taskTime': taskTime.toString(),
      'taskCategory': taskCategory.toString(),
      'taskPriority': taskPriority.toString(),
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      taskName: map['taskName'],
      taskNotes: map['taskNotes'],
      taskDate: DateTime.parse(map['taskDate']),
      taskTime: TimeOfDay.fromDateTime(DateTime.parse(map['taskTime'])),
      taskCategory: Category.values[map['taskCategory'] ?? 0],
      taskPriority: Priority.values[map['taskPriority'] ?? 0],
    );
  }

}
