import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    final dataProvider = ref.watch(
      employeeDataControllerProvider(
        Tuple2(phoneNumber, password),
      ),
    );

       
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: dataProvider.employeeList.length,
          itemBuilder: (context, index) {
            return Text(
              dataProvider.employeeList[index].employeeEmail.toString(),
            );
          },
        ),
      ),
    );
  }
}
