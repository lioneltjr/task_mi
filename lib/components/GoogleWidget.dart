import 'package:flutter/material.dart';
import 'package:taskme/components/constants.dart';

class GoogleWidget extends StatefulWidget {
  bool keyboardOpen;
  GoogleWidget({this.keyboardOpen});
  @override
  _GoogleWidgetState createState() => _GoogleWidgetState();
}

class _GoogleWidgetState extends State<GoogleWidget> with SingleTickerProviderStateMixin{
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    // TODO: implement initState
   controller = AnimationController(
     duration: Duration(milliseconds: 400),
     vsync: this,
   );
   //controller.forward();
   animation = CurvedAnimation(parent: controller, curve: Curves.easeInOutExpo);
   controller.addListener((){
     setState(() {});
   });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  bool isOpen = false;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 110),
          child: Opacity(
            opacity: widget.keyboardOpen ? 0.0:1.0 ,
            child: GestureDetector(
             onTap: (){
               switch (controller.status) {
                 case AnimationStatus.completed:
                   controller.reverse();
                   isOpen = false;
                   break;
                 case AnimationStatus.dismissed:
                   controller.forward();
                   isOpen = true;
                   break;
                 default:

               }

             },
              child: Container(
                height: 70,
                width: 70 + (MediaQuery.of(context).size.width - 70)/2  * animation.value,
                decoration: BoxDecoration(
                    color: Global.lesshotpink,
                    borderRadius: BorderRadius.horizontal(left: Radius.circular(10),),
                    boxShadow: [
                      BoxShadow(color: Global.pink, offset: Offset(4,4), blurRadius: 2),
                      BoxShadow(color: Global.white, offset: Offset(-4,-4), blurRadius: 2),
                    ]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Global.lesshotpink,
                              blurRadius: 20.0, // soften the shadow
                              spreadRadius: 5, //extend the shadow
                            )
                          ],
                        ),
                        child: Image(
                          image: AssetImage(
                            'assets/images/googlecoloricon.png',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: isOpen? animation.value* 15: 0
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          print("SIGNINGOOGLE");
                        },
                        child: Container(
                          child: isOpen ?
                          Opacity(
                            opacity: 1.0 * animation.value,
                              child: Text(
                                'Sign in with Google',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Global.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                ),
                              )
                          ) :
                          Container(height: 0, width: 0,)
                        ),
                      ),
                    )

                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
