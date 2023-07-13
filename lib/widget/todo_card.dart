import 'package:drift/drift.dart' show Value;
import 'package:simple_todo/constant/color_palette.dart' as palette;
import 'package:simple_todo/constant/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../database.dart';

class TodoCard extends StatelessWidget {
  final int id;
  final DateTime date;
  final String content;
  final bool finished;

  const TodoCard({
    Key? key,
    required this.id,
    required this.date,
    required this.finished,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              child: GestureDetector(
                onTap: () async {
                  await GetIt.I<LocalDatabase>().updateTodo(
                      id,
                      TodoTableCompanion(
                        finished: Value(!finished),
                        date: Value(date),
                        content: Value(content),
                      ));
                },
                child: Icon(
                  finished ? Icons.check : Icons.close,
                  color: finished ? palette.color1 : palette.color2,
                  size: 23,
                ),
              ),
            ),
            Expanded(
              child: Text(
                content,
                style: const TextStyle(
                  fontSize: 17,
                  fontFamily: 'Pretendard',
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        const CustomDivider(),
      ],
    );
  }
}
