import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartTimerButton extends StatelessWidget {
  final Function() onPressed;
  final bool isRunning;

  const StartTimerButton({
    Key? key,
    required this.onPressed,
    this.isRunning = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon((!isRunning) ? Icons.play_circle : Icons.pause_circle),
      label: Text((!isRunning) ? 'START' : 'PAUSE'),
      clipBehavior: Clip.antiAlias,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(120, 44),
        elevation: (!isRunning) ? 6 : 0,
        primary: Theme.of(context).primaryColor,
        onPrimary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}
