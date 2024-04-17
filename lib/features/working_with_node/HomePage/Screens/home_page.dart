// ignore_for_file: unused_local_variable

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progress/CommonElements/nav_bar.dart';
import 'package:progress/features/working_with_node/HomePage/Screens/components/ongoing_process_container.dart';
import 'package:progress/features/working_with_node/HomePage/Screens/components/progress_bar.dart';
import 'package:progress/features/working_with_node/HomePage/Screens/components/task_group_container.dart';
import '../../LoginPage/Controller/employee_datacontroller.dart';

class HomePage extends ConsumerWidget {
  final String phoneNumber;
  final String password;
  const HomePage({
    super.key,
    required this.phoneNumber,
    required this.password,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Color.fromARGB(255, 102, 88, 93),
        systemNavigationBarColor: Colors.black));

    final size = MediaQuery.of(context).size;
    final dataProvider = ref.watch(
      employeeDataControllerProvider(
        Tuple2(phoneNumber, password),
      ),
    );

    final employeeFullName = dataProvider.employeeList.isNotEmpty
        ? dataProvider.employeeList[0].employeeName.toString()
        : '';

    final firstName = employeeFullName.split(' ')[0];

    final department = dataProvider.employeeList.isNotEmpty
        ? dataProvider.employeeList[0].employeeName.toString()
        : '';

    final employeephoneNumber = dataProvider.employeeList.isNotEmpty
        ? dataProvider.employeeList[0].employeeName.toString()
        : '';

    final employeeEmail = dataProvider.employeeList.isNotEmpty
        ? dataProvider.employeeList[0].employeeName.toString()
        : '';

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            backgroundColorScreen(size),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, top: 20),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage(
                            "assets/person.jpg",
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              employeeFullName,
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon:
                              const Icon(Icons.notifications_active, size: 30),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: Container(
                      height: 165,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 3, 38, 66),
                            Color.fromARGB(255, 13, 69, 116),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(25.0),
                                child: SizedBox(
                                  width: 180,
                                  child: Text(
                                    "Your Today's Task is almost Done",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 25),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "View Task",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TaskProgressIndicator(
                                completedTasks: 20,
                                totalTasks: 25,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, top: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          "In Progress",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 2.0),
                              child: Container(
                                height: 23,
                                width: 23,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromARGB(255, 173, 207, 235)),
                                child: const Center(
                                    child: Text(
                                  "${2}",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                )),
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: SizedBox(
                      height: 190,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return const Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: OnGoingProcessContainer(),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 30.0, top: 20),
                    child: Text(
                      "Task Group",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return const Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: TaskGroupContainer(),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 150,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   shape: const CircleBorder(),
      //   child: IconButton(
      //     onPressed: () {},
      //     icon: const Icon(
      //       Icons.add,
      //       size: 35,
      //       color: Color.fromARGB(255, 61, 5, 63),
      //     ),
      //   ),
      //   onPressed: () {},
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: const ButtonNavigationBar(),
      // backgroundColor: const Color.fromARGB(255, 215, 225, 236),
    );
  }

 static Column backgroundColorScreen(Size size) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 207, 177, 177),
                  Color.fromARGB(255, 194, 212, 230)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
