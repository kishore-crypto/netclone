import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/Screen/Home_screen.dart';

import 'widget.dart/widgets.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    Scaffold(key: PageStorageKey('HomeScreen')),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];
  final Map<String, IconData> _icons = const {
    'Home': Icons.home,
    'Search': Icons.search,
    'Coming Soon': Icons.queue_play_next,
    'Downloads': Icons.file_download,
    'About Tweak': Icons.account_box,
  };
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: !Responsive.isDesktop(context)
          ? BottomNavigationBar(
              type: BottomNavigationBarType.shifting,
              backgroundColor: Colors.black,
              items: _icons
                  .map((title, icon) => MapEntry(
                      title,
                      BottomNavigationBarItem(
                        icon: Icon(icon, size: 30.0),
                        // ignore: deprecated_member_use
                        title: Text(title),
                      )))
                  .values
                  .toList(),
              currentIndex: _currentIndex,
              selectedItemColor: Colors.black,
              selectedFontSize: 15.0,
              unselectedFontSize: 11.0,
              unselectedItemColor: Colors.grey,
              onTap: (index) => setState(() => _currentIndex = index),
            )
          : null,
    );
  }
}
