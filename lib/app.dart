import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/screens/app_screen.dart';
import 'package:todo/state/todo_list/todo_list_cubit.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoListCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AppScreen(),
      ),
    );
  }
}
