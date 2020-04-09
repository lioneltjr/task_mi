import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:taskme/components/my_flutter_app_icons.dart';
import 'package:taskme/components/constants.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;
  bool _isSelected = false;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation:10,
      selectedItemColor: Global.hotpink,
      unselectedItemColor: Global.lesshotpink,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(MyFlutterApp.path_15),
          title: Text('home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.search),
          title: Text('search'),
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.plusSquare),
          title: Text('add'),
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.heart),
          title: Text('likes'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          title: Text('account'),
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}