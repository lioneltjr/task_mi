import 'package:flutter/material.dart';
import 'package:taskme/components/constants.dart';

class ButtonWidget extends StatelessWidget {

  final String title;
  final bool hasBorder;
  final String pageRoute;
  ButtonWidget({this.hasBorder,this.title,this.pageRoute,});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment(0.1,6.2) ,
            colors: hasBorder ? [Global.white,Global.white] : [ Global.lesshotpink, Global.hotpink]
          ),

          color: hasBorder ? Global.white : Global.lesshotpink,
          borderRadius: BorderRadius.circular(10),
          border: hasBorder ? Border.all(
            color: Global.hotpink,
            width: 1.0,
          )
              : Border.fromBorderSide(BorderSide.none),
        ),
        child: InkWell(
          onTap: (){
            Navigator.pushNamed(
              context,
              pageRoute
            );
          },
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            height: 60.0,
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: hasBorder? Global.hotpink : Global.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
