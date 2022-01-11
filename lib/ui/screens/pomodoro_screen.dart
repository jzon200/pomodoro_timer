import 'package:flutter/material.dart';
import 'package:pomodoro_timer/ui/widgets/widgets.dart';

class PomodoroScreen extends StatefulWidget {
  const PomodoroScreen({Key? key}) : super(key: key);

  @override
  _PomodoroScreenState createState() => _PomodoroScreenState();
}

class _PomodoroScreenState extends State<PomodoroScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(top: 60),
        width: double.infinity,
        color: Theme.of(context).backgroundColor,
        child: PomodoroTimer(),
      ),
    );
  }
}
