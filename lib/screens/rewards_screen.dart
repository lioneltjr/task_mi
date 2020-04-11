import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:taskme/components/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RewardsScreen extends StatefulWidget {

  @override
  _RewardsScreenState createState() => _RewardsScreenState();
}

class _RewardsScreenState extends State<RewardsScreen> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  bool _selectedCategory = true;
  Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward(from: 0);
    _controller.addListener((){
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: Global.lesshotpink,
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Global.greywhite,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(
                                      0.3,0.3
                                  ),
                                  blurRadius: 4
                              )
                            ]
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Hey, Lionel Teo!',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.black54
                                  ),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  'Your Total Earnings:',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black45
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top:3.0),
                                  child: FaIcon(
                                    FontAwesomeIcons.gem,
                                    size: 19,
                                  ),
                                ),
                                Text(
                                  '100.00',
                                  style: TextStyle(
                                    fontSize: 26,
                                    fontFamily: 'Avenir',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
}
