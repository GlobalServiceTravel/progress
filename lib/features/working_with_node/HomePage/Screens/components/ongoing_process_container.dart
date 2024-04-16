import 'package:flutter/material.dart';
import 'package:progress/features/working_with_node/HomePage/Screens/components/progress_bar.dart';

class OnGoingProcessContainer extends StatelessWidget {
  const OnGoingProcessContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.7,
      decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 200, 225, 245),
          ),
          color: const Color.fromARGB(255, 223, 236, 247),
          borderRadius: BorderRadius.circular(15)),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15.0, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Project Title",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 131, 130, 130)),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0, right: 10, bottom: 10),
            child: Text(
              overflow: TextOverflow.clip,
              "Austrila form of Swarawan kumar",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text("9 Days Remaining ......"),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0, right: 25 , top:  20),
            child: TaskProgressIndicatorLinear(
              completedTasks: 20,
              totalTasks: 22,
            ),
          ),
        ],
      ),
    );
  }
}
