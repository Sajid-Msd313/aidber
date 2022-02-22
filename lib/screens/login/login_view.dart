import 'package:aidber/global_widgets/box_shadow.dart';
import 'package:aidber/global_widgets/colors.dart';
import 'package:aidber/screens/home_screen/home_screen_view.dart';
import 'package:aidber/screens/recover_password_screen/recover_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (_, constraints) {
            print("height: " + constraints.maxHeight.toString());
            print("width: " + constraints.maxWidth.toString());
            final width = constraints.biggest.width;
            return SingleChildScrollView(
              dragStartBehavior: DragStartBehavior.down,
              child: Container(
                height: constraints.maxHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome to Lorem',
                      style: TextStyle(
                          color: PRIMARY_COLOR,
                          fontSize: 23,
                          fontWeight: FontWeight.bold),
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20,vertical: 40),
                          //  margin: EdgeInsets.only(top: 40),
                          decoration: boxdecoration,
                          padding: const EdgeInsets.all(20.0),

                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  decoration: InputDecoration(
                                      filled: true,
                                      contentPadding: EdgeInsets.all(20),
                                      fillColor: Colors.grey.shade300,
                                      focusColor: Colors.white,
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(13)),
                                      prefixIcon: const Icon(Icons.contact_mail),
                                     // labelText: '| Username',
                                      hintText: "| Username",
                                      enabled: true),
                                  enabled: true,
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
                                      prefixIcon: const Icon(Icons.lock),
                                      hintText: '| Password',
                                      enabled: true),
                                  enabled: true,
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: FlatButton(
                                    child: Text(
                                      'Forgot Password?',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      Get.to(() => const Recover_Password());
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: Get.width * .9,
                                  height: 45,
                                  child: FlatButton(
                                    child: const Text('Sign In'),
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8.0)),
                                    textColor: PRIMARY_COLOR,
                                    onPressed: () {
                                      Get.off(() => HomeScreenView());
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Column(
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
                                          vertical: 15, horizontal: 10),
                                      child: Text(
                                        'Or Sign up using',
                                        style:
                                        TextStyle(fontWeight: FontWeight.w400),
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
                            CircleAvatar(
                              child: Image.asset("assets/google.jpg"),
                            ),
                          ],
                        ),
                      ],
                    ),
                    /*SizedBox(
                      height: MediaQuery.of(context).size.height * 0.12,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Do not have an Account? ',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        InkWell(
                          onTap: (){
                            Get.to(SignUp());
                          },
                          child: Text(
                            "Create Account",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.blue)),
                        )],
                    )*/
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
