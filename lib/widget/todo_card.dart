import 'package:simple_todo/constant/color_palette.dart' as palette;
import 'package:simple_todo/constant/custom_divider.dart';
import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final String content;
  final bool finished;
  final Function()? onTap;

  const TodoCard({
    Key? key,
    required this.finished,
    required this.content,
    required this.onTap,
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
                onTap: onTap,
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
