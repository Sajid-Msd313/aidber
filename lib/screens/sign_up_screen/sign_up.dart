import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                ClipPath(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 350,
                    color: Get.theme.primaryColor,
                  ),
                  clipper: CustomClipPath(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 90, left: 20),
                  child: InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child: const Icon(Icons.arrow_back)),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 130, left: 20),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
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
                      Container(margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        // width: 250,
                        // height: 50,
                        decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey..withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset:
                                  const Offset(5, 3), // changes position of shadow
                                ),
                              ]),
                          // borderRadius: BorderRadius.circular(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              child: Image.asset("assets/facebook.jpg"),

                            ),
                            const SizedBox(
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
                    top: 240,
                    left: 20,
                    right: 20,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey..withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  const Offset(5, 3), // changes position of shadow
                            ),
                          ]),
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 4.0),
                                child: const Icon(Icons.supervised_user_circle_sharp, color: const Color(0xFF282d6b),),
                              ),
                              const Text('Sign up as User', style: const TextStyle(color: const Color(0xFF282d6b)),),
                              const Padding(
                                padding: EdgeInsets.only(left: 2.0),
                                child: const Text('|'),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 4.0),
                                child: Icon(Icons.supervised_user_circle_sharp),
                              ),
                              const Text('Sign up as Doctor'),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey.shade300,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(13)),
                                prefixIcon: const Icon(Icons.contact_mail),
                                labelText: '| Full Name',
                                enabled: true),
                            enabled: true,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextField(
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey.shade300,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(13)),
                                prefixIcon: const Icon(Icons.email_outlined),
                                labelText: '| Email',
                                enabled: true),
                            enabled: true,
                          ),
                          const SizedBox(
                            height: 5,
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
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            width: 310,
                            height: 40,
                            child: FlatButton(
                              child: const Text('Sign Up'),
                              color:  Get.theme.primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)),
                              textColor: Colors.white,
                              onPressed: () {},
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'By Continuing, I confirm that I have read and agree to the ',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400),
                          ),
                           Center(
                            child:  Text(
                              'Terms and Conditions and Privacy Policy',
                              style: TextStyle(
                                  color:  Get.theme.primaryColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                          )
                        ],
                      ),
                    )),
              ],
            )),
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
