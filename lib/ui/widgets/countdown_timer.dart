import 'package:flutter/material.dart';
import 'edit_task_button.dart';
import 'start_timer_button.dart';

class CountdownTimer extends AnimatedWidget {
  final Animation<int> animation;

  const CountdownTimer({Key? key, required this.animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);
    final minutes =
        clockTimer.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds =
        clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0');
    final timerText = '$minutes:$seconds';
    return Center(
      child: Container(
        height: 250,
        width: 250,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            stops: [0.7, 0.85, 1],
            center: Alignment.center,
            colors: [
              Theme.of(context).backgroundColor,
              Color(0xFFFFE1DE),
              Colors.white,
            ],
          ),
        ),
        child: Center(
          child: Text(
            timerText,
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
      ),
    );
  }
}

enum Timer {
  pomodoro,
  shortBreak,
  longBreak,
}

class PomodoroTimer extends StatefulWidget {
  const PomodoroTimer({Key? key}) : super(key: key);

  @override
  _PomodoroTimerState createState() => _PomodoroTimerState();
}

class _PomodoroTimerState extends State<PomodoroTimer>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late int countdown;
  int pomodoroIntervals = 3;
  Timer timer = Timer.pomodoro;
  String title = 'POMODORO';
  var _isRunning = false;

  @override
  void initState() {
    super.initState();
    countdown = 25;
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: countdown),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void nextInterval() {
    if (timer == Timer.pomodoro) pomodoroIntervals++;
    setState(() {
      if (timer != Timer.pomodoro) {
        timer = Timer.pomodoro;
        title = 'POMODORO';
        countdown = 25 + 1;
      } else if (timer != Timer.longBreak && pomodoroIntervals % 4 == 0) {
        timer = Timer.longBreak;
        title = 'LONG BREAK';
        countdown = 15 + 1;
      } else {
        timer = Timer.shortBreak;
        title = 'SHORT BREAK';
        countdown = 5 + 1;
      }
    });
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: countdown),
    )..forward().whenComplete(() => nextInterval);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline4,
        ),
        const SizedBox(height: 16),
        EditTaskButton(),
        const SizedBox(height: 56),
        CountdownTimer(
            animation: StepTween(
          begin: countdown,
          end: 0,
        ).animate(_controller)
              ..addListener(() {
                if (_controller.isCompleted) {
                  nextInterval();
                }
              })),
        Text(
          'Intervals: $pomodoroIntervals',
          style: Theme.of(context).textTheme.headline4,
        ),
        const SizedBox(height: 80),
        StartTimerButton(
          onPressed: () {
            setState(() {
              if (_controller.isAnimating && _isRunning) {
                _isRunning = false;
                _controller.stop();
              } else {
                _isRunning = true;
                _controller.forward().whenComplete(() => nextInterval);
              }
            });
          },
          isRunning: _isRunning,
        ),
      ],
    );
  }
}
