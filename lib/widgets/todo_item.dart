import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:todo/constants/theme_constants.dart';
import 'package:todo/models/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;

  const TodoItem({
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
        color: ThemeColors.container,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: ThemeColors.text, width: 2),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(todo.title, style: ThemeFonts.r16),
                if (todo.dueDate != null) const SizedBox(height: 6),
                if (todo.dueDate != null)
                  Text(
                    DateFormat('dd MMMM').format(todo.dueDate!),
                    style: ThemeFonts.r14.copyWith(
                      color: ThemeColors.fadedText,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: ThemeColors.primary),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              children: [
                SvgPicture.asset('assets/images/flag.svg'),
                const SizedBox(width: 5),
                Text(todo.priority.toString(), style: ThemeFonts.r12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
