import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo/constants/theme_constants.dart';
import 'package:todo/state/todo_list/todo_list_cubit.dart';
import 'package:todo/state/todo_list/todo_list_state.dart';

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
      body: BlocBuilder<TodoListCubit, TodoListState>(
        builder: (context, state) {
          switch (state.runtimeType) {
            case TodoListLoadingState:
              return const _Loading();
            case TodoListEmptyState:
              return const _Empty();
            case TodoListLoadedState:
              return const _Loaded();
            case TodoListErrorState:
              return const _Error();
            default:
              return const SizedBox();
          }

          if (state is TodoListLoadingState) {
            return const _Loading();
          }

          if (state is TodoListEmptyState) {
            return const _Empty();
          }

          if (state is TodoListLoadedState) {
            return const _Loaded();
          }

          if (state is TodoListErrorState) {
            return const _Error();
          }

          return const SizedBox();
        },
      ),
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
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
  const _Loaded({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _Error extends StatelessWidget {
  const _Error({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
