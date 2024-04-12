// ignore_for_file: unused_local_variable

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progress/features/working_with_node/HomePage/Screens/components/progress_bar.dart';
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
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
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
                        icon: const Icon(Icons.notifications_active, size: 30),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 8, 63, 109),
                            Color.fromARGB(255, 3, 38, 66),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20)),
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
                                  child: const Text("View Task")),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TaskProgressIndicator(
                              completedTasks: 9,
                              totalTasks: 25,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
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
            height: size.height * 0.5,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 247, 236, 236),
                  Color.fromARGB(255, 237, 239, 241)
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: size.height * 0.5,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 237, 239, 241),
                  Color.fromARGB(255, 247, 236, 236),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
