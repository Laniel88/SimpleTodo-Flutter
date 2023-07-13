import 'dart:io';
import 'package:drift/drift.dart';
import 'package:simple_todo/model/todo_table.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:drift/native.dart';

part 'database.g.dart'; // flutter pub run build_runner build

@DriftDatabase(
  tables: [
    TodoTable,
  ],
)
class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(_openConnection());

  Future<int> createTodo(TodoTableCompanion data) =>
      into(todoTable).insert(data);

  Future<int> updateTodo(int id, TodoTableCompanion data) =>
      (update(todoTable)..where((todo) => todo.id.equals(id))).write(data);

  Future<int> removeTodo(int id) =>
      (delete(todoTable)..where((todo) => todo.id.equals(id))).go();

  Stream<List<TodoTableData>> watchTodos() => select(todoTable).watch();

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
