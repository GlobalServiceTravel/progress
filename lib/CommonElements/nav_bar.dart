import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:progress/features/working_with_node/AddTask/screens/add_task.dart';
import 'package:progress/features/working_with_node/HomePage/Screens/home_page.dart';
import 'package:progress/features/working_with_node/schedule/screens/schedule.dart';

//  111111111111111111112
class ButtonNavigationBar extends StatefulWidget {
  const ButtonNavigationBar({super.key});

  @override
  State<ButtonNavigationBar> createState() => _ButtonNavigationBarState();
}

class _ButtonNavigationBarState extends State<ButtonNavigationBar> {
  final List<IconData> iconList = [
    Icons.home,
    Icons.calendar_month,
    Icons.work,
    Icons.person,
  ]; // Add more icons as needed

  int bottomNavIndex = 0;

  List<Widget> widgetList = [
    const HomePage(phoneNumber: "9866570482", password: "123456"),
    const ScheduleRoutine(),
    const ScheduleRoutine(),
    const ScheduleRoutine(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetList[bottomNavIndex],
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        child: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddTask()));
          },
          icon: const Icon(
            Icons.add,
            size: 35,
            color: Color.fromARGB(255, 61, 5, 63),
          ),
        ),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        splashRadius: 0.5,
        elevation: 10,
        icons: iconList,
        iconSize: 26,
        activeColor: Colors.pink,
        backgroundColor: const Color.fromARGB(255, 207, 177, 177),
        activeIndex: bottomNavIndex,
        notchSmoothness: NotchSmoothness.softEdge,
        gapLocation: GapLocation.center,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) => setState(() => bottomNavIndex = index),
      ),
      backgroundColor: const Color.fromARGB(255, 215, 225, 236),
    );
  }
}
