import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:taskme/components/ItemWidget.dart';
import 'package:taskme/screens/mainNav.dart';
import 'package:taskme/components/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:taskme/components/TaskWidget.dart';

class AddTaskScreen extends StatelessWidget {
  final List<Widget> tasklist = [
    TaskWidget(image: 'assets/images/brushteeth.jpg',title: 'Brush your teeth!',difficulty: 'Beginner',points: 10,tag:'1'),
    TaskWidget(image: 'assets/images/preparedinner.jpg',title: 'Help to prepare dinner!',difficulty: 'Intermediate',points: 20,tag:'2'),
    TaskWidget(image: 'assets/images/walkpet.jpg',title: 'Walk the dog!',difficulty: 'Easy',points: 15,tag:'3'),
    TaskWidget(image: 'assets/images/brushteeth.jpg',title: 'Brush your teeth!',difficulty: 'Beginner',points: 10,tag:'4'),
    TaskWidget(image: 'assets/images/preparedinner.jpg',title: 'Help to prepare dinner!',difficulty: 'Intermediate',points: 20,tag:'5'),
    TaskWidget(image: 'assets/images/walkpet.jpg',title: 'Walk the dog!',difficulty: 'Easy',points: 15,tag:'6'),
    TaskWidget(image: 'assets/images/brushteeth.jpg',title: 'Brush your teeth!',difficulty: 'Beginner',points: 10,tag:'7'),
    TaskWidget(image: 'assets/images/preparedinner.jpg',title: 'Help to prepare dinner!',difficulty: 'Intermediate',points: 20,tag:'8'),
    TaskWidget(image: 'assets/images/walkpet.jpg',title: 'Walk the dog!',difficulty: 'Easy',points: 15,tag:'9'),
    TaskWidget(image: 'assets/images/brushteeth.jpg',title: 'Brush your teeth!',difficulty: 'Beginner',points: 10,tag:'10'),
    TaskWidget(image: 'assets/images/preparedinner.jpg',title: 'Help to prepare dinner!',difficulty: 'Intermediate',points: 20,tag:'11'),
    TaskWidget(image: 'assets/images/walkpet.jpg',title: 'Walk the dog!',difficulty: 'Easy',points: 15,tag:'12'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
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
      backgroundColor: Global.greywhite,
      body: Container(
        width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 22,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'All available tasks',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'HappyMarker',
                          color: Global.hotpink
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Filter ',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color:Global.lesshotpink
                          ),
                        ),
                        Icon(
                          Icons.filter_list,
                          color: Global.lesshotpink,
                          size: 13,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: MediaQuery.of(context).size.height - 15 - 22 - 20 -164, //15 sizedbox, 22 font size, 20 padding, 156 navbar bottom and appbar
                child: ListView.builder(
                    itemCount:tasklist.length, itemBuilder: (context,index){
                  return Container(
                      child:tasklist[index]
                  );
                }),
              )
            ],
          )
      ),
    );
  }
}
