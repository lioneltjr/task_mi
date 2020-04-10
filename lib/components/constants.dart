import 'dart:ui';
import 'package:flutter/material.dart';

class Global {
  static const List validEmail = ['lionelteo@gmail.com'];
  static const Color white = Color(0xFFF4F4F5);
  static const Color pink = Color(0xFFDFB9CB);
  static const Color blue = Color(0xFFAFD5EC);
  static const Color purple = Color(0xFFda9eff);
  static const Color purple2 = Color(0xFFA071E4);
  static const Color purple3 = Color(0xFF616789);
  static const Color purple4 = Color(0xFFA4AFED);
  static const Color purple5 = Color(0xFF5A599F);
  static const Color hotpink = Color(0xFFff7591);
  static const Color lesshotpink = Color(0xffffadbe);
  static const Color red = Color(0xfff78981);


  //TODO: add different color theme & switch

  Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  double screenHeight(BuildContext context, {double dividedBy = 1}) {
    return screenSize(context).height / dividedBy;
  }

  double screenWidth(BuildContext context, {double dividedBy = 1}) {
    return screenSize(context).width / dividedBy;
  }


}