import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskme/components/TextFieldWidget.dart';
import 'package:taskme/components/WaveWidget.dart';
import 'package:taskme/viewmodels/home_model.dart';
import 'package:taskme/components/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class RegisterScreen extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  final db = Firestore.instance;
  String email;
  String password;
  String name;
  String userType;

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeModel>(context);
    final size = MediaQuery.of(context).size;
    bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      backgroundColor: Global.white,
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 40),
                Opacity(
                  opacity: keyboardOpen ? 0.0 : 1.0,
                  child: Image(
                    height: 50,
                    image: AssetImage(
                      'assets/images/task_mi_logo.png',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Opacity(
                      opacity: keyboardOpen ? 0.0 : 1.0,
                      child: Text(
                        'Register',
                        style: TextStyle(
                            color: Global.lesshotpink,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'HappyMarker'),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Opacity(
                  opacity: keyboardOpen ? 0.0 : 1.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      GestureDetector(
                        onTap: (){
                          userType = 'parent';
                          print(userType);
                      },
                        child: Container(
                          height: 150,
                          width: 150,
                          color: Colors.red,
                          child: Center(
                            child: Text(
                              'PARENT'
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap:(){
                          userType = 'child';
                          print(userType);
                        },
                        child: Container(
                          height: 150,
                          width: 150,
                          color: Colors.red,
                          child: Center(
                            child: Text(
                              'CHILD'
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextFieldWidget(
                  hintText: 'Name',
                  obscureText: false,
                  prefixIconData: Icons.face,
                  suffixIconData: model.isValid ? Icons.check : null,
                  onChanged: (value) {
                    model.isValidEmail(value);
                    name = value;
                  },
                ),
                SizedBox(height: 10),
                TextFieldWidget(
                  hintText: 'Email',
                  obscureText: false,
                  prefixIconData: Icons.mail_outline,
                  suffixIconData: model.isValid ? Icons.check : null,
                  onChanged: (value) {
                    model.isValidEmail(value);
                    email = value;
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
                      onChanged: (value){
                        password = value;
                      },
                    ),
                    SizedBox(height: 10),
                    Text('Forgot password?',
                        style: TextStyle(
                          color: Global.hotpink,
                        ))
                  ],
                ),
                SizedBox(height: 20),
                Material(
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment(0.1,6.2) ,
                          colors: [ Global.lesshotpink, Global.hotpink]
                      ),
                      color:  Global.lesshotpink,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: InkWell(
                      onTap: () async{
                        try {
                          final newUser = await _auth
                              .createUserWithEmailAndPassword(
                              email: email, password: password);
                          if(newUser != null){
                            db.collection("users").add(
                                {
                                  "name" : name,
                                  "email" : email,
                                  "userType" : userType,
                                }).then((value){
                              print(value.documentID);
                            });
                            //Navigator.pushNamed(context,'/home');
                          }
                        }
                        catch(e){
                          print(e);
                        }
                      },
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        height: 60.0,
                        child: Center(
                          child: Text(
                            'Register',
                            style: TextStyle(
                              color: Global.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Material(
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment(0.1, 6.2),
                          colors: true
                              ? [Global.white, Global.white]
                              : [Global.lesshotpink, Global.hotpink]),
                      color: true ? Global.white : Global.lesshotpink,
                      borderRadius: BorderRadius.circular(10),
                      border: true
                          ? Border.all(
                              color: Global.hotpink,
                              width: 1.0,
                            )
                          : Border.fromBorderSide(BorderSide.none),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        height: 60.0,
                        child: Center(
                          child: Text(
                            'Return to login',
                            style: TextStyle(
                              color: true ? Global.hotpink : Global.white,
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
