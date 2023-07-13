import 'package:drift/drift.dart';

class TodoTable extends Table {
  IntColumn get id => integer().autoIncrement()(); // Primary key
  BoolColumn get finished => boolean()();
  TextColumn get content => text()();
  DateTimeColumn get date => dateTime()();
}
