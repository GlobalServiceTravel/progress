import 'package:flutter/material.dart';

class TaskProgressIndicator extends StatefulWidget {
  final int completedTasks;
  final int totalTasks;

  TaskProgressIndicator({
    required this.completedTasks,
    required this.totalTasks,
  });

  @override
  _TaskProgressIndicatorState createState() => _TaskProgressIndicatorState();
}

class _TaskProgressIndicatorState extends State<TaskProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000), // Adjust duration as needed
    );
    _animation = Tween<double>(begin: 0, end: widget.completedTasks.toDouble())
        .animate(_controller)
          ..addListener(() {
            setState(() {}); // Update widget on animation frame
          });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double progress = _animation.value / widget.totalTasks;
    return Container(
      width: 60,
      height: 60,
      child: CircularProgressIndicator(
        strokeWidth: 17,
        value: progress,
      ),
    );
  }
}
