import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:myspaces/models/task.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static const int _version = 1;
  static const String _dbName = "tasks.db";

  static final _table = 'tasks';
  static final _columnId = 'id';
  static final _columnTaskName = 'taskName';
  static final _columnTaskNotes = 'taskNotes';
  static final _columnTaskDate = 'taskDate';
  static final _columnTaskTime = 'taskTime';
  static final _columnTaskCategory = 'taskCategory';
  static final _columnTaskPriority = 'taskPriority';

  static DatabaseHelper _databaseHelper = DatabaseHelper._createInstance();
  static late Database _database;

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + _dbName;

    var tasksDatabase =
        await openDatabase(path, version: _version, onCreate: _createDb);
    return tasksDatabase;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $_table ($_columnId INTEGER PRIMARY KEY AUTOINCREMENT,$_columnTaskName TEXT NOT NULL,$_columnTaskNotes TEXT,$_columnTaskDate TEXT NOT NULL,$_columnTaskTime TEXT NOT NULL,$_columnTaskCategory TEXT NOT NULL,$_columnTaskPriority TEXT NOT NULL)');
  }

  Future<List<Map<String, dynamic>>> getTaskMapList() async {
    Database db = await database;
    //var result = await db.rawQuery('SELECT * FROM tasks ORDER BY taskDate ASC, taskTime ASC');
    var result = await db.query(_table,
        orderBy: '$_columnTaskDate ASC, $_columnTaskTime ASC');
    return result;
  }

  Future<int> insertTask(Task task) async {
    Database db = await database;
    var result = await db.insert(_table, task.toMap());
    return result;
  }

  Future<int> updateTask(Task task) async {
    Database db = await database;
    var result = await db.update(_table, task.toMap(),
        where: '$_columnId = ?', whereArgs: [task.id]);
    return result;
  }

  Future<int> deleteTask(int? id) async {
    Database db = await database;
    var result =
        await db.rawDelete('DELETE FROM $_table WHERE $_columnId = ?', [id]);
    return result;
  }

  Future<int?> getCount() async {
    Database db = await database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from $_table');
    int? result = Sqflite.firstIntValue(x);
    return result;
  }

  Future<List<Task>> getTaskList() async {
    var taskMapList = await getTaskMapList();
    int count = taskMapList.length;

    List<Task> taskList = <Task>[];
    for (int i = 0; i < count; i++) {
      taskList.add(Task.fromMap(taskMapList[i]));
    }
    return taskList;
  }
}
