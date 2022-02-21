import 'package:aidber/global_widgets/colors.dart';
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(margin: EdgeInsets.symmetric(vertical: 10),
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: InkWell(
                        onTap: (){
                          Get.back();
                        },
                        child:  Icon(Icons.arrow_back,color: PRIMARY_COLOR,)),
                  ),
                  Container(margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          color:PRIMARY_COLOR,
                          fontSize: 23,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    decoration: BoxDecoration(
                        color: PRIMARY_COLOR,
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

                        TextField(
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey.shade300,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13)),
                              prefixIcon: const Icon(Icons.contact_mail),
                              labelText: '| Username',
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
                            color:  Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            textColor: PRIMARY_COLOR,
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'By Continuing, I confirm that I have read and agree to the Terms & Condition and Privacy Policy ',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400,color: Colors.white),textAlign: TextAlign.center,
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
                  ),
                  const SizedBox(height: 10,),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
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
                                'Or Sign Up using',
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
                      SizedBox(height: 5,),
                      CircleAvatar(
                        child: Image.asset("assets/google.jpg"),
                      ),
                    ],
                  ),


                ],
              )),
        ),
      ),
    );
  }
}

