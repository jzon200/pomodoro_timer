import 'package:flutter/material.dart';

class CountdownTimer extends AnimatedWidget {
  final Animation<int> animation;

  const CountdownTimer({Key? key, required this.animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);
    final minutes = clockTimer.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0');
    final timerText = '$minutes:$seconds';
    return Text(
      timerText,
      style: Theme.of(context).textTheme.headline3,
    );
  }
}
