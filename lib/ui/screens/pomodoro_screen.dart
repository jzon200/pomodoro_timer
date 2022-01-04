import 'package:flutter/material.dart';
import 'package:pomodoro_timer/ui/theme/pomodoro_app_theme.dart';
import '../widgets/countdown_timer.dart';

class PomodoroScreen extends StatefulWidget {
  const PomodoroScreen({Key? key}) : super(key: key);

  @override
  _PomodoroScreenState createState() => _PomodoroScreenState();
}

class _PomodoroScreenState extends State<PomodoroScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  static int pomodoroTime = 1;
  int levelClock = pomodoroTime * 60;
  String _label = 'Start'.toUpperCase();
  String _title = 'Pomodoro'.toUpperCase();
  IconData _iconData = Icons.play_circle;
  List<BoxShadow> _boxShadow = [
    const BoxShadow(
      color: Color(0xFFBF7972),
      spreadRadius: 2,
      blurRadius: 1,
      offset: Offset(0, 3.5),
    ),
  ];

  void reset() {
    setState(() {
      levelClock = 300;
      _animationController = AnimationController(
        vsync: this,
        duration: Duration(seconds: levelClock),
      );
      _title = 'Short Break'.toUpperCase();
      _label = 'Play'.toUpperCase();
      _iconData = Icons.play_circle;
      _boxShadow = [
        const BoxShadow(
          color: Color(0xFFBF7972),
          spreadRadius: 2,
          blurRadius: 1,
          offset: Offset(0, 3.5),
        ),
      ];
    });
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: levelClock),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(top: 32),
        width: double.infinity,
        color: Theme.of(context).backgroundColor,
        child: Column(
          children: [
            Text(
              _title,
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(
              height: 16,
            ),
            buildEditTaskButton(context),
            const SizedBox(height: 164),
            CountdownTimer(
              animation: StepTween(
                begin: levelClock,
                end: 0,
              ).animate(_animationController),
            ),
            const SizedBox(height: 190),
            buildTimer(context),
          ],
        ),
      ),
    );
  }

  InkWell buildTimer(BuildContext context) {
    return InkWell(
      onTap: () {
        if (_animationController.isAnimating) {
          setState(() {
            _iconData = Icons.play_circle;
            _label = 'Play'.toUpperCase();
            _boxShadow = [
              const BoxShadow(
                color: Color(0xFFBF7972),
                spreadRadius: 2,
                blurRadius: 1,
                offset: Offset(0, 3.5),
              ),
            ];
          });
          _animationController.stop();
        } else {
          setState(() {
            _iconData = Icons.pause_circle;
            _label = 'Pause'.toUpperCase();
            _boxShadow = [];
          });
          _animationController.forward().whenComplete(reset);
        }
      },
      child: Container(
        width: 120,
        height: 44,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: _boxShadow,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _iconData,
              color: Colors.white,
            ),
            const SizedBox(width: 8),
            Text(
              _label,
              style: Theme.of(context)
                  .textTheme
                  .button!
                  .copyWith(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  Widget buildEditTaskButton(BuildContext context) {
    return Container(
      width: 200,
      height: 44,
      decoration: BoxDecoration(
        color: PomodoroAppTheme.white80,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Theme.of(context).primaryColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.edit,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            'TASK: Write an article',
            style: Theme.of(context)
                .textTheme
                .button!
                .copyWith(color: Theme.of(context).primaryColor),
          ),
        ],
      ),
    );
  }
}
