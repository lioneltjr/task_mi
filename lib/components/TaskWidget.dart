import 'package:flutter/material.dart';
import 'package:taskme/components/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:taskme/components/TaskDetailsWidget.dart';

class TaskWidget extends StatelessWidget {
  final String title;
  final String difficulty;
  final int points;
  final String image;
  final String tag;
  TaskWidget({this.image, this.title, this.difficulty, this.points,this.tag});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag:tag,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: (){Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TaskDetailsWidget(
                    image: image,
                    tag: tag,
                    title: title,
                    points: points,
                    difficulty: difficulty,
                  )));},
          child: Container(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height / 8,
                      width: MediaQuery.of(context).size.height / 8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.height / 9,
                            width: MediaQuery.of(context).size.height / 9,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage(image),
                                fit: BoxFit.cover,
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey[300],
                                    blurRadius: 1,
                                    offset: Offset(1, 1)),
                                BoxShadow(
                                    color: Global.white,
                                    blurRadius: 0.8,
                                    offset: Offset(-1, -1))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width -
                          MediaQuery.of(context).size.height / 8 -
                          40, //20 padding per side
                      height: MediaQuery.of(context).size.height / 8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.height / 8 -
                                1, //-1 for divider height
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  width: MediaQuery.of(context).size.width -
                                      MediaQuery.of(context).size.height / 8 -
                                      40,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 12.0, bottom: 9),
                                        child: Text(
                                          difficulty,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 0.1,
                                              color: Global.pink),
                                        ),
                                      ),
                                      Text(title,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w900,
                                              letterSpacing: 0.2,
                                              color: Global.hotpink)),
                                      Row(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(bottom: 1),
                                            child: FaIcon(
                                              FontAwesomeIcons.gem,
                                              color: Global.lesshotpink,
                                              size: 15,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context).size.width -
                                                MediaQuery.of(context).size.height / 8 -
                                                40 -
                                                15 -
                                                5 -
                                                2,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      top: 8.0, bottom: 6.0),
                                                  child: Text(
                                                      points.toString() + ' points',
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight: FontWeight.w500,
                                                          letterSpacing: 0.1,
                                                          color: Global.hotpink)),
                                                ),
                                                InkWell(
                                                  onTap: (){
                                                    print('addtask');
                                                  },
                                                  borderRadius: BorderRadius.circular(20),
                                                  child: Container(
                                                    padding: EdgeInsets.only(
                                                        top: 7,
                                                        bottom: 5,
                                                        right: 6,
                                                        left: 6),
                                                    decoration: BoxDecoration(
                                                        color: Global.lesshotpink,
                                                        borderRadius:
                                                            BorderRadius.circular(20)),
                                                    child: Text(
                                                      'Add Task',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 10),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 1,
                            thickness: 1,
                            color: Global.lesshotpink,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
