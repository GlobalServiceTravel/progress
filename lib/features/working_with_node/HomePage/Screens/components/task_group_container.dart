import 'package:flutter/material.dart';

class TaskGroupContainer extends StatelessWidget {
  const TaskGroupContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 248, 205, 232),
              ),
              child: const Icon(
                Icons.work,
                color: Color.fromARGB(255, 228, 118, 188),
                size: 35,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "office Project",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 54, 53, 53),
                  ),
                ),
                Text(
                  "23 Task",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 146, 143, 143),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
