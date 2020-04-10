import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskme/screens/login_screen.dart';
import 'package:taskme/components/TextFieldWidget.dart';
import 'package:taskme/components/ButtonWidget.dart';
import 'package:taskme/components/WaveWidget.dart';
import 'package:taskme/viewmodels/home_model.dart';
import 'package:taskme/components/constants.dart';
import 'package:taskme/screens/home_screen.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final model = Provider.of<HomeModel>(context);
    final size = MediaQuery.of(context).size;
    bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: <Widget>[
          Container(
              height: size.height - 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomCenter,
                  colors: [Global.pink, Global.lesshotpink, Colors.red],
                ),
              )),
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeOutQuad,
            top: keyboardOpen ? -size.height / 3.7 : 0.0,
            child: WaveWidget(
              size: size,
              yOffset: size.height / 3.0,
              color: Global.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 70),
                Opacity(
                  opacity: keyboardOpen ? 0.0 : 1.0,
                  child: Image(
                    height: 100,
                    image: AssetImage(
                      'assets/images/task_mi_logo.png',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Register',
                      style: TextStyle(
                          color: Global.white,
                          fontSize: 45.0,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'HappyMarker'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextFieldWidget(
                  hintText: 'Email',
                  obscureText: false,
                  prefixIconData: Icons.mail_outline,
                  suffixIconData: model.isValid ? Icons.check : null,
                  onChanged: (value) {
                    model.isValidEmail(value);
                  },
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextFieldWidget(
                      hintText: 'password',
                      obscureText: model.isVisible ? false : true,
                      prefixIconData: Icons.lock_outline,
                      suffixIconData: model.isVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    SizedBox(height: 10),
                    Text('Forgot password?',
                        style: TextStyle(
                          color: Global.hotpink,
                        ))
                  ],
                ),
                SizedBox(height: 20),
                ButtonWidget(
                  title: 'Register',
                  hasBorder: false,
                  pageRoute: '/home',
                ),
                SizedBox(height: 10),
            Material(
              child: Ink(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment(0.1,6.2) ,
                      colors: true ? [Global.white,Global.white] : [ Global.lesshotpink, Global.hotpink]
                  ),

                  color: true ? Global.white : Global.lesshotpink,
                  borderRadius: BorderRadius.circular(10),
                  border: true ? Border.all(
                    color: Global.hotpink,
                    width: 1.0,
                  )
                      : Border.fromBorderSide(BorderSide.none),
                ),
                child: InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    height: 60.0,
                    child: Center(
                      child: Text(
                        'Return to login',
                        style: TextStyle(
                          color: true? Global.hotpink : Global.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
