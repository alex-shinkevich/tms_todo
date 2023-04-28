import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo/constants/theme_constants.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  void _navigate(int index) {
    DefaultTabController.of(context).index = index;
    // setState(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    DefaultTabController.of(context).addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeColors.container,
      padding: const EdgeInsets.only(top: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavBarIcon(
            title: 'Index',
            isActive: DefaultTabController.of(context).index == 0,
            notActiveIcon: SvgPicture.asset('assets/images/home.svg'),
            activeIcon: SvgPicture.asset('assets/images/home_active.svg'),
            onTap: () => _navigate(0),
          ),
          _NavBarIcon(
            title: 'Calendar',
            isActive: DefaultTabController.of(context).index == 1,
            notActiveIcon: SvgPicture.asset('assets/images/calendar.svg'),
            activeIcon: SvgPicture.asset('assets/images/calendar_active.svg'),
            onTap: () => _navigate(1),
          ),
          const SizedBox(),
          _NavBarIcon(
            title: 'Focus',
            isActive: DefaultTabController.of(context).index == 2,
            notActiveIcon: SvgPicture.asset('assets/images/clock.svg'),
            activeIcon: SvgPicture.asset('assets/images/clock_active.svg'),
            onTap: () => _navigate(2),
          ),
          _NavBarIcon(
            title: 'Profile',
            isActive: DefaultTabController.of(context).index == 3,
            notActiveIcon: SvgPicture.asset('assets/images/user.svg'),
            activeIcon: SvgPicture.asset('assets/images/user_active.svg'),
            onTap: () => _navigate(3),
          ),
        ],
      ),
    );
  }
}

class _NavBarIcon extends StatelessWidget {
  final String title;
  final bool isActive;
  final Widget notActiveIcon;
  final Widget activeIcon;
  final VoidCallback onTap;

  const _NavBarIcon({
    Key? key,
    required this.title,
    required this.isActive,
    required this.notActiveIcon,
    required this.activeIcon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        children: [
          isActive ? activeIcon : notActiveIcon,
          const SizedBox(height: 8),
          Text(title, style: ThemeFonts.r12),
        ],
      ),
    );
  }
}
