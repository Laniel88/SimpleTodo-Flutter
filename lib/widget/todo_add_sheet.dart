import 'package:drift/drift.dart' show Value;
import 'package:simple_todo/constant/color_palette.dart' as palette;
import 'package:simple_todo/database.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class TodoAddSheet extends StatefulWidget {
  final Function(String text) saveValue;

  const TodoAddSheet({
    Key? key,
    required this.saveValue,
  }) : super(key: key);

  @override
  State<TodoAddSheet> createState() => _TodoAddSheetState();
}

class _TodoAddSheetState extends State<TodoAddSheet> {
  String content = '';

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      color: Colors.white,
      height: 200 + bottomInset,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Column(
          children: [
            TextField(
              onChanged: (String? text) {
                content = text ?? '';
              },
              cursorColor: Colors.black,
              maxLines: 1,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontFamily: 'Pretendard',
              ),
              decoration: const InputDecoration(
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: palette.color1, width: 1.0)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2.0)),
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                widget.saveValue(content);
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_circle_up,
                size: 35,
              ),
              color: palette.color1,
            ),
            SizedBox(height: bottomInset)
          ],
        ),
      ),
    );
  }
}
