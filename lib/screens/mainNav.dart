import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:taskme/components/my_flutter_app_icons.dart';
import 'package:taskme/components/constants.dart';
import 'package:taskme/screens/add_task_screen.dart';
import 'package:taskme/screens/home_screen.dart';

class MainNav extends StatefulWidget {
  @override
  _MainNavState createState() => _MainNavState();
}

class _MainNavState extends State<MainNav> {
  int _selectedIndex = 0;
  bool _isSelected = false;

  final List<Widget>_children = [
    HomeScreen(),
    AddTaskScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        backgroundColor: Global.lesshotpink,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: (){},
                  child: IconButton(
                    icon: Icon(
                      Icons.notifications_none,
                      color: Global.white,
                    ),
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: (){},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 40,
                        height: 35,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/task_mi_logo.png'),
                                fit: BoxFit.fill
                            )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:8.0),
                        child: Text(
                          'Task Mi!',
                          style: TextStyle(
                              fontFamily: 'HappyMarker',
                              fontSize: 30,
                              color: Global.white,
                              wordSpacing: 0,
                              letterSpacing: 0,
                              shadows: [
                                Shadow( // bottomLeft
                                    offset: Offset(-0.2, -0.2),
                                    color: Global.purple
                                ),
                                Shadow( // bottomLeft
                                    offset: Offset(0.2, 0.2),
                                    color: Global.purple
                                ),
                              ]
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: (){},
                  child: IconButton(
                    onPressed:(){},
                    icon: FaIcon(
                      FontAwesomeIcons.commentDots,
                      color: Global.white,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
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
      ),
    );
  }
}