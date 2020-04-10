import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskme/components/constants.dart';
import 'package:taskme/viewmodels/FadeAnimation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TaskDetailsWidget extends StatefulWidget {
  final String image;
  final String tag;
  final int points;
  final String title;
  final String difficulty;
  const TaskDetailsWidget({Key key, this.image, this.tag,this.points, this.title, this.difficulty}) : super(key: key);

  @override
  _TaskDetailsWidgetState createState() => _TaskDetailsWidgetState();
}


class _TaskDetailsWidgetState extends State<TaskDetailsWidget> {

  ScrollController _controller;
  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
      });
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        Navigator.pop(context);
      });
    }
  }
  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              controller: _controller,
              child: Column(
                children: <Widget>[
                  Hero(
                    tag: widget.tag,
                    child: Wrap(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Container(
                              height: MediaQuery.of(context).size.height / 2,
                              width: double.infinity,
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(widget.image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.all(150),
                                decoration: BoxDecoration(
                                    gradient:
                                        LinearGradient(begin: Alignment.bottomRight, colors: [
                                  Colors.black.withOpacity(.3),
                                  Colors.black.withOpacity(.0),
                                ])),
                              ),
                            ),
                            Positioned(
                              left: 15,
                              top: MediaQuery.of(context).size.height / 2 - 90,
                              right: 80,
                              bottom: 10,
                              child: FadeAnimation(
                                  0.7,
                                  Container(
                                    width: MediaQuery.of(context).size.width / 1.5,
                                    child: Material(
                                      type: MaterialType.transparency,
                                      child: Text(
                                        widget.title,
                                        style: TextStyle(
                                            color: Global.white,
                                            fontSize: 24,
                                            fontWeight: FontWeight.w900,
                                            letterSpacing: 0),
                                      ),
                                    ),
                                  )),
                            ),
                            Positioned(
                              left: 15,
                              top: MediaQuery.of(context).size.height / 2 - 30,
                              bottom: 10,
                              child: FadeAnimation(
                                  0.7,
                                  Container(
                                    child: Material(
                                      type: MaterialType.transparency,
                                      child: Text(
                                        widget.difficulty,
                                        style: TextStyle(
                                            color: Global.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  )),
                            ),
                            Positioned(
                              top: MediaQuery.of(context).size.height / 2 - 34,
                              left: MediaQuery.of(context).size.width - 115,
                              child: FadeAnimation(
                                  0.7,
                                  Row(
                                    children: <Widget>[
                                      FaIcon(
                                        FontAwesomeIcons.gem,
                                        color: Global.white,
                                        size: 15,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 3.0),
                                        child: Material(
                                          type: MaterialType.transparency,
                                          child: Text(
                                            widget.points.toString()+' points',
                                            style: TextStyle(
                                                color: Global.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                              ),
                            )
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                                padding: EdgeInsets.all(15),
                                child: FadeAnimation(1,Material(
                                type: MaterialType.transparency,child: Text('ascascascascascascascascascascscascascascascascascascascscascascascascascascascascscascascascascascascascascscascascascascascascascascscascascascascascascascascscascascascascascascascascscascascascascascascascascscascascascascascascascascscascascascascascascascascscascascascascascascascascscascascascascascascascascscascascascascascascascascscascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascascasc'))),
                            )],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
