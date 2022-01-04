import 'package:flutter/material.dart';
import 'package:pomodoro_timer/ui/theme/pomodoro_app_theme.dart';
import 'package:pomodoro_timer/ui/screens/pomodoro_screen.dart';
import 'package:pomodoro_timer/ui/screens/progress_screen.dart';
import 'package:pomodoro_timer/ui/screens/settings_screen.dart';
import 'package:pomodoro_timer/ui/widgets/countdown_timer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>  {
  int _selectedTabIndex = 0;
  final List<Widget> _pages = const [
    PomodoroScreen(),
    ProgressScreen(),
    SettingsScreen(),
  ];

  void goToTab(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedTabIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor:
            Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
        currentIndex: _selectedTabIndex,
        onTap: goToTab,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: 'Pomodoro',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.date_range),
            label: 'Progress',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
