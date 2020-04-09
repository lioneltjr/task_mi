import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskme/components/ItemDetailsWidget.dart';
import 'package:taskme/components/constants.dart';
import 'package:taskme/viewmodels/FadeAnimation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemWidget extends StatefulWidget {
  final String image;
  final String tag;
  final String title;
  final String difficulty;
  final int duration;
  final context;
  ItemWidget(
      {this.image,
      this.tag,
      this.context,
      this.duration,
      this.title,
      this.difficulty});

  @override
  _ItemWidgetState createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.tag,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ItemDetailsWidget(
                        image: widget.image,
                        tag: widget.tag,
                      )));
        },
        child: Stack(
          children: <Widget>[
            Container(
              height: 250,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage(widget.image),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey[400],
                        blurRadius: 1,
                        offset: Offset(2, 2)),
                    BoxShadow(
                        color: Global.white,
                        blurRadius: 0.8,
                        offset: Offset(-2, -3))
                  ]),
            ),
            Container(
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0x70000000),
                    const Color(0x50000000),
                    const Color(0x40000000),
                    const Color(0x20000000),
                    const Color(0x20000000),
                    const Color(0x10000000),
                    const Color(0x00000000),
                    const Color(0x00000000),
                    const Color(0x10000000),
                    const Color(0x20000000),
                    const Color(0x20000000),
                    const Color(0x30000000),
                    const Color(0x40000000),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 15,
              left: 15,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
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
                            letterSpacing: 0,
                            fontFamily: 'HappyMarker'),
                      ),
                    ),
                  ),
                  Container(
                    child: Material(
                      type: MaterialType.transparency,
                      child: Text(
                        widget.difficulty,
                        style: TextStyle(
                            color: Global.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              left:15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                    padding: const EdgeInsets.only(top: 7.0),
                    child: Material(
                      type: MaterialType.transparency,
                      child: Text(
                        widget.duration.toString() + ' Points',
                        style: TextStyle(
                            color: Global.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
