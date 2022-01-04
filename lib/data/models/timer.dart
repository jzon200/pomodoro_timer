class Timer {
  static const _pomodoro = 25;
  static const _shortBreak = 5;
  static const _longBreak = 15;

  void startPomodoro({int time = _pomodoro}) {
    final totalMinutes = time;
    final totalSeconds = totalMinutes * 60;
  }
}
