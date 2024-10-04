import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'drift_database.g.dart';

class Tasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get taskName => text().withLength(min: 1, max: 50)();
  TextColumn get subject => text()();
  TextColumn get timeHour => text().nullable()();
  TextColumn get timeMinute => text().nullable()();
  TextColumn get timeAmOrPm => text().nullable()();
  TextColumn get description => text().nullable()();
}

class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 50)();
  TextColumn get surName => text().withLength(min: 1, max: 50)();
  TextColumn get email => text().withLength(min: 1, max: 80)();
  TextColumn get password => text().withLength(min: 1, max: 30)();
}

@DriftDatabase(tables: [Users, Tasks])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<Task>> getAllTasks() => select(tasks).get();
  Stream<List<Task>> watchAllTasks() {
    return (select(tasks)..orderBy([(t) => OrderingTerm.asc(t.id)])).watch();
  }

  Future<int> insertTask(TasksCompanion task) async {
    print("Inserting task: $task");
    return into(tasks).insert(task);
  }

  Future<int> deleteTask(int id) async {
    print("Deleting task with ID: $id");
    return (delete(tasks)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<int> onUpdate(TasksCompanion updatedTask) async {
    print("Updating task: $updatedTask");
    return (update(tasks)
          ..where((task) => task.id.equals(updatedTask.id.value)))
        .write(updatedTask);
  }

  Future<void> closeDatabase() async {
    await close();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    print('Database file path: $dbFolder');
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    //print('Database file path: ${file.path}');
    return NativeDatabase(file);
  });
}