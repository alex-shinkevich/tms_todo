import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo/constants/theme_constants.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/state/todo_list/todo_list_cubit.dart';
import 'package:todo/state/todo_list/todo_list_state.dart';
import 'package:todo/widgets/todo_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.scaffold,
      appBar: AppBar(
        backgroundColor: ThemeColors.scaffold,
        elevation: 0,
        title: const Text('Index'),
        centerTitle: true,
        actions: [
          Image.asset('assets/images/avatar.png'),
          const SizedBox(width: 24),
        ],
        leading: Center(child: SvgPicture.asset('assets/images/sort.svg')),
        leadingWidth: 72,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: BlocBuilder<TodoListCubit, TodoListState>(
          builder: (context, state) {
            switch (state.runtimeType) {
              case TodoListLoadingState:
                return const _Loading();
              case TodoListEmptyState:
                return const _Empty();
              case TodoListLoadedState:
                return _Loaded(todos: (state as TodoListLoadedState).todos);
              case TodoListErrorState:
                return _Error(errorText: (state as TodoListErrorState).errorText);
              default:
                return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator(color: ThemeColors.primary));
  }
}

class _Empty extends StatelessWidget {
  const _Empty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 75),
        SvgPicture.asset('assets/images/empty_todo_list.svg'),
        const SizedBox(height: 10),
        const Text(
          'What do you want to do today?',
          style: ThemeFonts.r20,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        const Text(
          'Tap + to add your tasks',
          style: ThemeFonts.r16,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}

class _Loaded extends StatelessWidget {
  final List<Todo> todos;

  const _Loaded({
    Key? key,
    required this.todos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => TodoItem(todo: todos[index]),
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemCount: todos.length,
    );
  }
}

class _Error extends StatelessWidget {
  final String errorText;

  const _Error({
    Key? key,
    required this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: ThemeColors.error,
      ),
      child: Text(errorText, style: ThemeFonts.r16),
    );
  }
}
