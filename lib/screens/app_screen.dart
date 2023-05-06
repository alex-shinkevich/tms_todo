import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo/constants/theme_constants.dart';
import 'package:todo/screens/calendar_screen.dart';
import 'package:todo/screens/focus_screen.dart';
import 'package:todo/screens/home_screen.dart';
import 'package:todo/screens/profile_screen.dart';
import 'package:todo/screens/todo_screen.dart';
import 'package:todo/widgets/nav_bar.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({Key? key}) : super(key: key);

  void _navigateTodoScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TodoScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            const Positioned(
              top: 0,
              bottom: 100,
              left: 0,
              right: 0,
              child: TabBarView(
                children: [
                  HomeScreen(),
                  CalendarScreen(),
                  FocusScreen(),
                  ProfileScreen(),
                ],
              ),
            ),
            const Positioned(
              left: 0,
              right: 0,
              height: 100,
              bottom: 0,
              child: NavBar(),
            ),
            Positioned(
              bottom: 68,
              child: GestureDetector(
                onTap: () => _navigateTodoScreen(context),
                child: Container(
                  width: 64,
                  height: 64,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: ThemeColors.primary,
                  ),
                  alignment: Alignment.center,
                  child: SvgPicture.asset('assets/images/add.svg'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
