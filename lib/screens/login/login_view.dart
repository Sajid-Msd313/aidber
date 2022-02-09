import 'package:aidber/global_widgets/box_shadow.dart';
import 'package:aidber/screens/home_screen/home_screen_view.dart';
import 'package:aidber/screens/recover_password_screen/recover_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Sign_In2 extends StatefulWidget {
  const Sign_In2({Key? key}) : super(key: key);

  @override
  _Sign_In2State createState() => _Sign_In2State();
}

class _Sign_In2State extends State<Sign_In2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (_, constraints){
          print("height: "  + constraints.maxHeight.toString());
          print("width: "  + constraints.maxWidth.toString());

          final width = constraints.biggest.width;
          final height = constraints.biggest.height;
          return SingleChildScrollView(
            child: Container(
              constraints: constraints.widthConstraints(),
              height:width> constraints.maxHeight? width : constraints.maxHeight,
              child: Stack(

                children: [
                  ClipPath(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height:  height *.55,
                      color: Get.theme.primaryColor,
                    ),
                    clipper: CustomClipPath(),
                  ),
                  Positioned(
                    top: height *.07,
                    left: 0,
                    right: width*.85,
                    child: InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child:const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: height *.12,
                    left:  width*.05,
                    right: 0,
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Positioned(

                    bottom: height * .04,
                    left: width * .05,
                    width: width *.9,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 1,
                                  width: MediaQuery.of(context).size.width * .2,
                                  color: Colors.black,
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  child: Text(
                                    'Or connect using',
                                    style: TextStyle(fontWeight: FontWeight.w400),
                                  ),
                                ),
                                Container(
                                  height: 1,
                                  width: MediaQuery.of(context).size.width * .2,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(margin: const EdgeInsets.symmetric( vertical: 10),
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                          // width: 250,
                          // height: 50,
                          decoration: boxdecoration,
                          // borderRadius: BorderRadius.circular(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                child: Image.asset("assets/facebook.jpg"),

                              ),
                              const   SizedBox(
                                width: 10,
                              ),

                              CircleAvatar(
                                child: Image.asset("assets/google.jpg"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Positioned(
                      top: height * .3,
                      left: width * .05,
                      width: width *.9,
                      child: Container(
                        decoration: boxdecoration,
                        padding: const  EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            const   SizedBox(
                              height: 10,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey.shade300,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(13)),
                                  prefixIcon: const Icon(Icons.contact_mail),
                                  labelText: '| Email',
                                  enabled: true),
                              enabled: true,
                            ),
                            const  SizedBox(
                              height: 10,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey.shade300,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(13)),
                                  prefixIcon: const Icon(Icons.lock),
                                  labelText: '| Password',
                                  enabled: true),
                              enabled: true,
                            ),
                            const  SizedBox(
                              height: 30,
                            ),
                            Container(
                              width: Get.width *.8,
                              height: 52,
                              child: FlatButton(
                                child: const Text('Sign In'),
                                color:  Get.theme.primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0)),
                                textColor: Colors.white,
                                onPressed: () {
                                  Get.off(()=>const HomeScreenView());
                                },
                              ),
                            ),
                            Container(
                              child: FlatButton(
                                child:  Text('Forgot Password?', style:  TextStyle(color:  Get.theme.primaryColor),),
                                onPressed: () {
                                  Get.to(()=> const Recover_Password());
                                },
                              ),
                            )
                          ],
                        ),
                      )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 10.0;

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 100);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 100);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

