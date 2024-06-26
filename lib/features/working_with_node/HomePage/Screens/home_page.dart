// ignore_for_file: unused_local_variable

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
                        const EdgeInsets.only(left: 30, right: 30, top: 30),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(
                            "assets/person.jpg",
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Hello!",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18),
                            ),
                            Text(
                              firstName,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 28,
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
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: Container(
                      height: 165,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 8, 63, 109),
                            Color.fromARGB(255, 3, 38, 66),
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
                                  child: const Text("View Task"),
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
                    padding: const EdgeInsets.only(left: 30.0, top: 30),
                    child: Row(
                      children: [
                        const Text(
                          "In Progress",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 173, 207, 235)),
                            child: const Center(child: Text("${2}")),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
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
                    padding: EdgeInsets.only(left: 35.0, top: 25, bottom: 15),
                    child: Text(
                      "Task Group",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return const Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: TaskGroupContainer(),
                          );
                        }),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column backgroundColorScreen(Size size) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 221, 180, 180),
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
