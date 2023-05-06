import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo/constants/theme_constants.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/state/todo_list/todo_list_cubit.dart';
import 'package:todo/widgets/custom_text_field.dart';
import 'package:todo/widgets/icon_text_field.dart';

class TodoScreen extends StatefulWidget {
  final Todo? todo;

  const TodoScreen({
    Key? key,
    this.todo,
  }) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _dueDateController = TextEditingController();
  final _priorityController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _titleController.text = widget.todo?.title ?? '';
    super.initState();
  }

  void _navigateBack(BuildContext context) => Navigator.of(context).pop();

  void _complete() {
    context.read<TodoListCubit>().createNewTodo(
          title: _titleController.text,
          description: _descriptionController.text,
          priority: _priorityController.text,
          dueDate: _dueDateController.text,
        );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: CalendarDatePicker(
    //     initialDate: DateTime.now(),
    //     firstDate: DateTime(2000, 1, 1),
    //     lastDate: DateTime.now(),
    //     onDateChanged: (value) {},
    //   ),
    // );

    return Scaffold(
      backgroundColor: ThemeColors.scaffold,
      appBar: AppBar(
        backgroundColor: ThemeColors.scaffold,
        elevation: 0,
        leadingWidth: 68,
        leading: Padding(
          padding: const EdgeInsets.only(left: 0),
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => _navigateBack(context),
            child: const SizedBox(
              width: 68,
              height: 48,
              child: Icon(Icons.close, color: ThemeColors.text),
            ),
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          children: [
            CustomTextField(
              controller: _titleController,
              placeholder: 'Title',
              style: ThemeFonts.r20,
            ),
            CustomTextField(
              controller: _descriptionController,
              placeholder: 'Description',
              style: ThemeFonts.r16,
            ),
            const SizedBox(height: 34),
            IconTextField(
              icon: SvgPicture.asset('assets/images/timer.svg'),
              placeholder: 'Task time',
              controller: _dueDateController,
            ),
            const SizedBox(height: 34),
            IconTextField(
              icon: SvgPicture.asset('assets/images/flag.svg'),
              placeholder: 'Task priority',
              controller: _priorityController,
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ElevatedButton(
          onPressed: _complete,
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(ThemeColors.primary),
            minimumSize: MaterialStatePropertyAll(Size(double.infinity, 50)),
          ),
          child: const Text('Create task'),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
