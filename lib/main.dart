import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:taskme/screens/add_task_screen.dart';
import 'package:taskme/screens/home_screen.dart';
import 'package:taskme/screens/login_screen.dart';
import 'package:taskme/screens/profile_screen.dart';
import 'package:taskme/screens/register_screen.dart';
import 'package:taskme/viewmodels/home_model.dart';
import 'package:taskme/screens/mainNav.dart';

void main() => runApp(TaskMe());

class TaskMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return ChangeNotifierProvider(
      create: (context)=>HomeModel(),
      child: MaterialApp(
      theme: ThemeData(
        fontFamily: 'Avenir',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => MainNav(),
        '/profile': (context) => ProfileScreen(),
        '/addTask': (context) => AddTaskScreen(),
      }
      ),
    );
  }
}

