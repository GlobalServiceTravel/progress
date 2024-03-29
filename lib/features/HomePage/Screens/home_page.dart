import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../LoginPage/Controller/employee_datacontroller.dart';
import '../../LoginPage/Models/employee_model.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<List<EmployeeModel>> showData() async {
      final dataProvider = ref.watch(employeeDataControllerProvider);
      final dataExtraction = dataProvider.employeeDataController();
      final data = await dataExtraction.then((value) {
        return dataExtraction;
      });

      print(data);

      return data;
    }

    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              showData();
            },
            child: const Text("press me ")),
      ),
    );
  }
}
