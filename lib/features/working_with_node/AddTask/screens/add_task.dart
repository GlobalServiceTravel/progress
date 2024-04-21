import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 207, 177, 177),
              Color.fromARGB(255, 203, 221, 240),
            ],
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Color.fromARGB(255, 94, 92, 92),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const Text(
                  "Add Task",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 26, 24, 24),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications_active,
                    size: 26,
                    color: Color.fromARGB(255, 75, 74, 74),
                  ),
                ),
              ],
            ),
            const DropdownContainer(),
          ],
        ),
      )),
    );
  }
}

class DropdownContainer extends StatefulWidget {
  const DropdownContainer({super.key});

  @override
  DropdownContainerState createState() => DropdownContainerState();
}

class DropdownContainerState extends State<DropdownContainer> {
  String selectedOption = 'Option 1';

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 223, 193, 193),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 5),
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 240, 183, 218),
                ),
                child: const Icon(
                  Icons.work,
                  color: Color.fromARGB(255, 228, 118, 188),
                  size: 25,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Task Group"),
                Text(
                  selectedOption,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            const Spacer(),
            DropdownButton<String>(
              icon: const Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.arrow_drop_down,
                  size: 40,
                ),
              ),
              iconSize: 24,
              elevation: 16,
              onChanged: (newValue) {
                setState(() {
                  selectedOption = newValue!;
                });
              },
              items: <String>['Option 1', 'Option 2', 'Option 3', 'Option 4']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
