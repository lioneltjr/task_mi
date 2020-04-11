import 'package:flutter/material.dart';
import 'package:taskme/components/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TransactionWidget extends StatelessWidget {
  final String title;
  final String difficulty;
  final int points;
  final String image;
  TransactionWidget({this.image, this.title, this.difficulty, this.points});



  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Container(
            width: MediaQuery.of(context).size.height - 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 14,
                  width: MediaQuery.of(context).size.height / 14,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height / 14,
                        width: MediaQuery.of(context).size.height / 14,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.height / 9),
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
                  width: MediaQuery.of(context).size.width - 30 - MediaQuery.of(context).size.height/14,
                  height: MediaQuery.of(context).size.height/14,
                  padding: EdgeInsets.only(left: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            title,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.2,
                                color: Colors.black54),
                          ),
                          Text(
                              difficulty,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.1,
                                  color: Colors.grey)
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '+ '+points.toString(),
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.2,
                                color: Colors.green),
                          ),
                          Text('Aug 26',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.1,
                                  color: Colors.grey)
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
//        Padding(
//          padding: const EdgeInsets.symmetric(horizontal: 15.0),
//          child: Divider(
//            height: 1,
//            thickness: 1,
//            color: Global.lesshotpink,
//          ),
//        )
      ],
    );
  }
}
