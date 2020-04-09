import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskme/viewmodels/home_model.dart';
import 'package:taskme/components/constants.dart';

class TextFieldWidget extends StatelessWidget {

  final String hintText;
  final IconData prefixIconData;
  final IconData suffixIconData;
  final bool obscureText;
  final Function onChanged;

  TextFieldWidget({this.hintText,this.obscureText,this.onChanged,this.prefixIconData,this.suffixIconData});

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeModel>(context);
    return TextField(
      onChanged: onChanged,
      obscureText: obscureText,
      style: TextStyle(
        color: Global.hotpink,
        fontSize: 14.0,
      ),
      cursorColor: Global.hotpink,
      decoration: InputDecoration(
        labelText: hintText,
        prefixIcon: Icon(
          prefixIconData,
          size: 18,
          color: Global.hotpink,
        ),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Global.hotpink),
        ),
        suffixIcon: GestureDetector(
          onTap: (){
            model.isVisible = !model.isVisible;
          },
          child: Icon(
            suffixIconData,
            size: 18,
            color: Global.hotpink,
          ),
        ),
        labelStyle: TextStyle(color: Global.hotpink),
        focusColor: Global.pink,
      ),

    );
  }
}
