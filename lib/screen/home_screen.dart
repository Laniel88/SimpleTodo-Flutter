import 'package:simple_todo/database.dart';
import 'package:simple_todo/widget/custom_calendar.dart';
import 'package:simple_todo/widget/todo_add_sheet.dart';
import 'package:simple_todo/widget/todo_card.dart';

import 'package:simple_todo/constant/color_palette.dart' as palette;
import 'package:simple_todo/constant/custom_divider.dart';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime _focusedDate = DateTime.now();
  DateTime _selectedDate = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) {
              return TodoAddSheet(
                selectedDate: _selectedDate,
              );
            },
          );
        },
        backgroundColor: palette.color1,
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: StreamBuilder<List<TodoTableData>>(
              stream: GetIt.I<LocalDatabase>().watchTodos(),
              builder: (context, snapshot) {
                // TodoList for selectedDate (used in ListView)
                List<TodoTableData> selectedTodos = [];
                if (snapshot.hasData) {
                  selectedTodos = snapshot.data!
                      .where((todo) => todo.date.toUtc() == _selectedDate)
                      .toList();
                }

                return Column(
                  children: [
                    CustomCalendar(
                        focusedDay: _focusedDate,
                        eventLoader: (DateTime date) {
                          if (snapshot.hasData && date != _selectedDate) {
                            final length = snapshot.data!
                                .where((todo) => todo.date.toUtc() == date)
                                .length;
                            return List.generate(length, (_) => true);
                          }
                          return [];
                        },
                        onDaySelected: (DateTime selectedDate, _) {
                          setState(() {
                            _selectedDate = selectedDate;
                            _focusedDate = selectedDate;
                          });
                        },
                        selectedDayPredicate: (DateTime date) {
                          return date.year == _selectedDate.year &&
                              date.month == _selectedDate.month &&
                              date.day == _selectedDate.day;
                        }),
                    const CustomDivider(),
                    Expanded(
                      child: ListView.builder(
                        itemCount: selectedTodos.length,
                        itemBuilder: (context, index) {
                          final todo = selectedTodos[index];
                          return Dismissible(
                            key: ObjectKey(todo.id),
                            direction: DismissDirection.endToStart,
                            onDismissed: (_) {
                              GetIt.I<LocalDatabase>().removeTodo(todo.id);
                            },
                            child: TodoCard(
                                id: todo.id,
                                date: todo.date.toUtc(),
                                content: todo.content,
                                finished: todo.finished),
                          );
                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 6.0),
                      child: Text(
                        "HYU EOS 2023",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                          fontFamily: 'Pretendard',
                        ),
                      ),
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }
}
