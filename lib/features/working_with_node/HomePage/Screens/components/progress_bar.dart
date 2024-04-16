import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class TaskProgressIndicator extends StatefulWidget {
  final int completedTasks;
  final int totalTasks;

  const TaskProgressIndicator({
    super.key,
    required this.completedTasks,
    required this.totalTasks,
  });

  @override
  TaskProgressIndicatorState createState() => TaskProgressIndicatorState();
}

class TaskProgressIndicatorState extends State<TaskProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700), // Adjust duration as needed
    );
    _animation = Tween<double>(begin: 0, end: widget.completedTasks.toDouble())
        .animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return CircularStepProgressIndicator(
                  totalSteps: widget.totalTasks,
                  currentStep: _animation.value.toInt(),
                  stepSize: 10,
                  selectedColor: const Color.fromARGB(255, 14, 138, 196),
                  unselectedColor: const Color.fromARGB(255, 136, 135, 135),
                  padding: 0,
                  width: 100,
                  height: 100,
                  selectedStepSize: 13,
                  roundedCap: (_, __) => true,
                );
              },
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}

class TaskProgressIndicatorLinear extends StatefulWidget {
  final int completedTasks;
  final int totalTasks;

  const TaskProgressIndicatorLinear({
    super.key,
    required this.completedTasks,
    required this.totalTasks,
  });

  @override
  State<TaskProgressIndicatorLinear> createState() =>
      _TaskProgressIndicatorLinearState();
}

class _TaskProgressIndicatorLinearState
    extends State<TaskProgressIndicatorLinear>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700), // Adjust duration as needed
    );
    _animation = Tween<double>(begin: 0, end: widget.completedTasks.toDouble())
        .animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return StepProgressIndicator(
                  totalSteps: widget.totalTasks,
                  currentStep: _animation.value.toInt(),
                  size: 12,
                  roundedEdges: const Radius.circular(20),
                  selectedColor: const Color.fromARGB(255, 14, 138, 196),
                  unselectedColor: const Color.fromARGB(255, 136, 135, 135),
                  padding: 0,
                  
                );
              },
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
