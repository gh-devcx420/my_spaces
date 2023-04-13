import 'package:flutter/material.dart';
import 'package:myspaces/utils/constants.dart';

class Task {
  int? id;
  String taskName;
  String taskNotes;
  String taskDate;
  String taskTime;
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

  // Convert Task object to a map for database operations
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'taskName': taskName,
      'taskNotes': taskNotes,
      'taskDate': taskDate,
      'taskTime': taskTime,
      'taskCategory': taskCategory.toString(),
      'taskPriority': taskPriority.toString(),
    };
  }

  // Create Task object from a map retrieved from database
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      taskName: map['taskName'],
      taskNotes: map['taskNotes'],
      taskDate: map['taskDate'],
      taskTime: map['taskTime'],
      taskCategory: Category.values.firstWhere(
            (category) => category.toString() == map['taskCategory'],
      ),
      taskPriority: Priority.values.firstWhere(
            (priority) => priority.toString() == map['taskPriority'],
      ),
    );
  }
}
