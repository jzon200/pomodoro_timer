import 'package:flutter/material.dart';
import 'ui/theme/pomodoro_app_theme.dart';
import 'ui/screens/main_screen.dart';

void main() {
  runApp(const PomodoroApp());
}

class PomodoroApp extends StatelessWidget {
  const PomodoroApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: PomodoroAppTheme.light(),
      home: const MainScreen(),
    );
  }
}
