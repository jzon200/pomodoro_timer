import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _selectedTabIndex = 0;
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
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value:
          SystemUiOverlayStyle(statusBarColor: Theme.of(context).primaryColor),
      child: Scaffold(
        body: IndexedStack(
          index: _selectedTabIndex,
          children: _pages,
        ),
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
              height: 60,
              backgroundColor: Theme.of(context).primaryColor,
              iconTheme: MaterialStateProperty.all(
                  const IconThemeData(color: Colors.white)),
              labelTextStyle:
                  MaterialStateProperty.all(Theme.of(context).textTheme.button),
              indicatorColor: const Color(0xFFFFA299),
              labelBehavior:
                  NavigationDestinationLabelBehavior.onlyShowSelected),
          child: NavigationBar(
            onDestinationSelected: goToTab,
            selectedIndex: _selectedTabIndex,
            destinations: const <NavigationDestination>[
              NavigationDestination(
                icon: Icon(Icons.timer_outlined),
                selectedIcon: Icon(Icons.timer),
                label: 'Pomodoro',
              ),
              NavigationDestination(
                icon: Icon(Icons.calendar_today_outlined),
                selectedIcon: Icon(Icons.calendar_today),
                label: 'Progress',
              ),
              NavigationDestination(
                icon: Icon(Icons.settings_outlined),
                selectedIcon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
