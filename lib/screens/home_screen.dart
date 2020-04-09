import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:taskme/components/ItemWidget.dart';
import 'package:taskme/components/BottomNav.dart';
import 'package:taskme/components/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  final List<Widget> workouts = [
    ItemWidget(image: 'assets/images/brushteeth.jpg',title: 'Brush your teeth!',difficulty: 'Beginner',duration: 10,tag: '3',),
    ItemWidget(image: 'assets/images/preparedinner.jpg',title: 'Help to prepare dinner!',difficulty: 'Intermediate',duration: 20,tag: '2',),
    ItemWidget(image: 'assets/images/walkpet.jpg',title: 'Walk the dog!',difficulty: 'Easy',duration: 15,tag: '4',),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(62.0),
        child: AppBar(
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
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Daily Challenges!',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'HappyMarker',
                      color: Global.hotpink
                  ),
                ),
                SizedBox(height: 10),
                ItemWidget(image: 'assets/images/sweeping.jpg',title: 'Sweep the floor!',difficulty: 'Difficult',duration: 30,tag: '1',),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'Ongoing Tasks',
                      style: TextStyle(
                        fontFamily: 'HappyMarker',
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        color: Global.hotpink
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'See more',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color:Global.lesshotpink
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Global.lesshotpink,
                          size: 8,
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: workouts.length, itemBuilder: (context,index){
                      return Container(
                        width: MediaQuery.of(context).size.width*0.6,
                        child: Padding(
                            padding: EdgeInsets.only(right: 10),
                            child:workouts[index]
                        ),
                      );
                  },
                  ),
                ),
              ],
            )
          ),
        ],
      ),
      bottomNavigationBar: BottomNav(),
      );
  }
}
