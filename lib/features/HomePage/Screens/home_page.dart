import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../LoginPage/Controller/employee_datacontroller.dart';
import '../../LoginPage/Models/employee_model.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<EmployeeModelState> getData() async {
      final stateData = await ref
          .watch(employeeDataControllerProvider.notifier)
          .employeeGetter();

          print(stateData);
      return stateData;
    }

    return Scaffold(
      body: Center(

     child: ElevatedButton(onPressed: (){
      getData();
     }, child: const  Text("press me ")),



        // child: FutureBuilder(
        //   future: getData(),
        //   builder: ((context, snapshot) {
        //     return const CircularProgressIndicator();
        //    if(snapshot.hasData){

        //     return    Column(
        //       children: [
        //         Text(snapshot.data.toString(),),
        //       ],
        //     );
        //    } else {
        //     return const CircularProgressIndicator();
        //    }
        //   }
        //   ),
        // ),
      ),
    );
  }
}
