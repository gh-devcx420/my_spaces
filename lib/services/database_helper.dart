import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:myspaces/models/task.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  static Database? _database;

  static const String tableName = 'tasks';
  static const String columnId = 'id';
  static const String columnTaskName = 'taskName';
  static const String columnTaskNotes = 'taskNotes';
  static const String columnTaskDate = 'taskDate';
  static const String columnTaskTime = 'taskTime';
  static const String columnTaskCategory = 'taskCategory';
  static const String columnTaskPriority = 'taskPriority';

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final String path = join(await getDatabasesPath(), 'my_spaces.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE IF NOT EXISTS $tableName (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnTaskName TEXT NOT NULL,
            $columnTaskNotes TEXT NOT NULL,
            $columnTaskDate TEXT NOT NULL,
            $columnTaskTime TEXT NOT NULL,
            $columnTaskCategory TEXT NOT NULL,
            $columnTaskPriority TEXT NOT NULL
          )
        ''');
      },
    );
  }

  // Insert a new task into the database
  Future<int> insertTask(Task task) async {
    final Database db = await database;
    return await db.insert(tableName, task.toMap());
  }


  // Retrieve all tasks from the database
  Future<List<Task>> getTasks() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query(tableName);
    return List.generate(
      maps.length,
          (index) => Task.fromMap(maps[index]),
    );
  }

  // Update a task in the database
  Future<int> updateTask(Task task) async {
    final Database db = await database;
    return await db.update(
      tableName,
      task.toMap(),
      where: '$columnId = ?',
      whereArgs: [task.id],
    );
  }

  // Delete a task from the database
  Future<int> deleteTask(int? taskId) async {
    final Database db = await database;
    return await db.delete(
      tableName,
      where: '$columnId = ?',
      whereArgs: [taskId],
    );
  }
}
