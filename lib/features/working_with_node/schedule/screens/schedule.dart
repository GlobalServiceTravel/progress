import 'package:flutter/material.dart';

class ScheduleRoutine extends StatelessWidget {
  const ScheduleRoutine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 207, 177, 177),
              Color.fromARGB(255, 194, 212, 230),
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
                child: Row(
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
                      "Today's Task",
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
                        size: 30,
                        color: Color.fromARGB(255, 75, 74, 74),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const SizedBox(
                height: 120,
                child: DateCounter(),
              ),
              const Divider(), // Add a divider between DateCounter and ShowWorkLog
              const Expanded(
                child: ShowWorkLog(),
              ), // Use Expanded to allow ShowWorkLog to take remaining space
            ],
          ),
        ),
      ),
    );
  }
}

class DateCounter extends StatefulWidget {
  const DateCounter({
    super.key,
  });

  @override
  State<DateCounter> createState() => _DateCounterState();
}

class _DateCounterState extends State<DateCounter> {
  List<String> days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

  late ScrollController _scrollController;

  var selectedDay = DateTime.now().day - 1;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    // Scroll to today's date
    _scrollToToday();
  }

  void _scrollToToday() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        selectedDay * 80.0 - (MediaQuery.of(context).size.width / 2) + (70 / 2),
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      itemCount: 30,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            setState(() {
              selectedDay = index;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              width: 70,
              decoration: BoxDecoration(
                color: selectedDay == index
                    ? const Color.fromARGB(255, 236, 169, 191)
                    : const Color.fromARGB(255, 255, 228, 228),
                borderRadius: BorderRadius.circular(10),
                border: selectedDay == index
                    ? Border.all(
                        color: const Color.fromARGB(255, 161, 156, 156))
                    : null,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Apr",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: selectedDay == index
                          ? Colors.black
                          : const Color.fromARGB(255, 122, 120, 120),
                    ),
                  ),
                  Text(
                    "${index + 1}",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: selectedDay == index
                          ? Colors.black
                          : const Color.fromARGB(255, 122, 120, 120),
                    ),
                  ),
                  Text(
                    days[(index) % 7],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: selectedDay == index
                          ? Colors.black
                          : const Color.fromARGB(255, 122, 120, 120),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class ShowWorkLog extends StatelessWidget {
  const ShowWorkLog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 15, right: 15.0, bottom: 5),
          child: Container(
            height: 105,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 255, 255, 0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 12.0, left: 12, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Austrila form of Swarawan Kumar",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 3),
                      Text(
                        "Visa Application",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 3),
                      Row(
                        children: [
                          Icon(
                            Icons.timer,
                            size: 21,
                            color: Color.fromARGB(255, 2, 62, 112),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 8.0,
                            ),
                            child: Text(
                              "01:00 AM",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 2, 62, 112),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color.fromARGB(255, 248, 205, 232),
                        ),
                        child: const Icon(
                          Icons.work,
                          color: Color.fromARGB(255, 228, 118, 188),
                          size: 20,
                        ),
                      ),
                      Container(
                        height: 25,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color.fromARGB(255, 181, 201, 216),
                        ),
                        child: const Center(
                          child: Text(
                            "Done",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
