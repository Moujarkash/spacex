import 'package:flutter/material.dart';
import 'package:spacex/view/pages/UpcomingLaunchesPage.dart';
import 'package:spacex/view/pages/next_launch_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _children = List<Widget>();
  int _currentIndex = 0;

  @override
  void initState() {
    _children.add(NextLaunchPage());
    _children.add(UpcomingLaunchesPage());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: _children[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            currentIndex: _currentIndex,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.timer),
                  label: ''
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.list),
                  label: ''
              )
            ],
          )),
    );
  }
}
