import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../LoginPage/Controller/employee_datacontroller.dart';



class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataProvider = ref.watch(employeeDataControllerProvider);
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: dataProvider.employeeList.length,
          itemBuilder: (context, index) {
            return Text(
              dataProvider.employeeList[index].employeeName.toString(),
            );
          },
        ),
      ),
    );
  }
}
