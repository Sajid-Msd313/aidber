import 'package:aidber/controllers/auth/signin_controller.dart';
import 'package:aidber/global_widgets/box_shadow.dart';
import 'package:aidber/global_widgets/circluar_progressIndicator.dart';
import 'package:aidber/global_widgets/colors.dart';
import 'package:aidber/screens/recover_password_screen/recover_password.dart';
import 'package:aidber/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../sign_up_screen/sign_up.dart';

class Sign_In2 extends StatefulWidget {
  const Sign_In2({Key? key}) : super(key: key);

  @override
  _Sign_In2State createState() => _Sign_In2State();
}

class _Sign_In2State extends State<Sign_In2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (_, constraints) {
            print("height: " + constraints.maxHeight.toString());
            print("width: " + constraints.maxWidth.toString());
            final width = constraints.biggest.width;
            return SingleChildScrollView(
              child: Container(
               height: constraints.maxHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: Get.height *.1,),
                    Text(
                      'Welcome to Lorem',
                      style: TextStyle(
                          color: PRIMARY_COLOR,
                          fontSize: 23,
                          fontWeight: FontWeight.bold),
                    ),
                    GetBuilder<signin_controller>(
                        init: signin_controller(),
                        builder: (controller) {
                          return Column(

                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 40),
                                //  margin: EdgeInsets.only(top: 40),
                               // decoration: boxdecoration,
                                padding: const EdgeInsets.all(20.0),

                                child: Center(
                                  child: Form(
                                    key: controller.FormKey,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                          controller: controller
                                              .emailTextEditingController,
                                          validator: (_) {
                                            //               if(!GetUtils.isUsername(_!)){
                                            //                 return "Please enter valid username";
                                            // }
                                            if (_!.isEmpty) {
                                              return "Please enter valid username";
                                            }
                                          },
                                          decoration: InputDecoration(
                                              filled: true,
                                              contentPadding:
                                                  EdgeInsets.all(20),
                                              fillColor: Colors.grey.shade300,
                                              focusColor: Colors.white,
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          13)),
                                              prefixIcon: const Icon(
                                                  Icons.contact_mail),
                                              // labelText: '| Username',
                                              hintText: "| Username",
                                              enabled: true),
                                          enabled: true,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                          obscureText: true,
                                          controller: controller
                                              .passwordTextEditingController,
                                          validator: (_) {
                                            if (_!.isEmpty) {
                                              return "Please enter valid password";
                                            }
                                          },
                                          decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.grey.shade300,
                                              border: OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          13)),
                                              prefixIcon:
                                                  const Icon(Icons.lock),
                                              hintText: '| Password',
                                              enabled: true),
                                          enabled: true,
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: FlatButton(
                                            child: Text(
                                              'Forgot Password?',
                                              style: TextStyle(
                                                  color: Colors.grey),
                                            ),
                                            onPressed: () {
                                              Get.to(() =>
                                                  const Recover_Password());
                                            },
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        controller.isLoading
                                            ? circular_progressIndicator()
                                            : Container(
                                                width: Get.width * .9,
                                                height: 45,
                                                child: FlatButton(
                                                  child: const Text('Sign In',style: TextStyle(color: Colors.white),),
                                                  color: PRIMARY_COLOR,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0)),
                                                  textColor: PRIMARY_COLOR,
                                                  onPressed: () {
                                                    controller.validate();
                                                    //Get.off(() => HomeScreenView());
                                                  },
                                                ),
                                              ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 1,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .2,
                                            color: Colors.black,
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 15, horizontal: 10),
                                            child: Text(
                                              'Or Sign up using',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                          Container(
                                            height: 1,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .2,
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
                          );
                        }),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(text: TextSpan(text: "Don't have an account? ",style: TextStyle(color: Colors.black),children: [
                        TextSpan(text: "Create an Account",recognizer: new TapGestureRecognizer()..onTap = () => Get.to(()=>SignUp()),style: TextStyle(color: primaryColor,fontWeight: FontWeight.bold))
                      ])),
                    )
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
