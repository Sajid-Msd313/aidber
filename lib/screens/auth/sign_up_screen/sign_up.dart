import 'package:aidber/controllers/auth/signup_controller.dart';
import 'package:aidber/global_widgets/box_shadow.dart';
import 'package:aidber/global_widgets/circluar_progressIndicator.dart';
import 'package:aidber/global_widgets/colors.dart';
import 'package:aidber/global_widgets/custom_button.dart';
import 'package:aidber/global_widgets/responsive_body.dart';
import 'package:aidber/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: responsive_body(
            child: GetBuilder<signup_controller>(
          init: signup_controller(),
          builder: (controller) {
            return Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: PRIMARY_COLOR,
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      color: PRIMARY_COLOR,
                      fontSize: 23,
                    ),
                  ),
                  SizedBox(
                    height: Get.height * .1,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    //decoration: boxdecoration,

                    child: Column(
                      children: [
                        TextFormField(
                          validator: (val) {
                            if (!GetUtils.isUsername(val!)) {
                              return "Enter valid username";
                            }
                          },
                          controller: controller.username,
                          decoration: InputDecoration(
                              filled: true,
                              contentPadding: EdgeInsets.all(5),
                              fillColor: Colors.grey.shade300,
                              border: input_border,
                              prefixIcon: const Icon(Icons.contact_mail),
                              labelText: '| Username',
                              enabled: true),
                          enabled: true,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          validator: (val) {
                            if (val!.length < 3) {
                              return "Enter valid name";
                            }
                          },
                          controller: controller.full_name,
                          decoration: InputDecoration(
                              filled: true,
                              contentPadding: EdgeInsets.all(5),
                              fillColor: Colors.grey.shade300,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(13)),
                              prefixIcon: const Icon(Icons.email_outlined),
                              labelText: '| Full Name',
                              enabled: true),
                          enabled: true,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          validator: (_) {
                            if (!GetUtils.isEmail(_!)) {
                              return "Enter valid email";
                            }
                          },
                          controller: controller.email,
                          decoration: InputDecoration(
                              filled: true,
                              contentPadding: EdgeInsets.all(5),
                              fillColor: Colors.grey.shade300,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(13)),
                              prefixIcon: const Icon(Icons.email_outlined),
                              labelText: '| Email',
                              enabled: true),
                          enabled: true,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          validator: (_) {
                            if (_!.isEmpty) {
                              return "Password must be entered";
                            }
                            if (_.length < 5) {
                              return "Password must be strong";
                            }
                          },
                          controller: controller.password,
                          decoration: InputDecoration(
                              filled: true,
                              contentPadding: EdgeInsets.all(5),
                              fillColor: Colors.grey.shade300,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(13)),
                              prefixIcon: const Icon(Icons.lock),
                              labelText: '| Password',
                              enabled: true),
                          enabled: true,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        controller.isLoading
                            ? circular_progressIndicator()
                            : Container(
                                width: double.infinity,
                                height: 40,
                                child: CustomButton(
                                  btnText: "Sign Up",
                                  showShadow: false,
                                  onPressed: () {
                                    controller.validate();
                                  },
                                  primary: true,
                                )),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'By Continuing, I confirm that I have read and agree to the',
                          style: TextStyle(
                              fontSize: 13.2,
                              fontWeight: FontWeight.w400,
                              color: primaryColor),
                          textAlign: TextAlign.center,
                        ),
                        Center(
                          child: Text(
                            'Terms and Conditions and Privacy Policy',
                            style: TextStyle(
                                color: Get.theme.primaryColor,
                                fontSize: 13.2,
                                fontWeight: FontWeight.w700),
                          ),
                        )
                      ],
                    ),
                  ),
                  Spacer(
                    flex: 3,
                  ),
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
                      SizedBox(
                        height: 5,
                      ),
                      CircleAvatar(
                        child: Image.asset("assets/google.jpg"),
                      ),
                    ],
                  ),
                  Spacer(
                    flex: 5,
                  ),
                ],
              ),
            );
          },
        )),
      ),
    );
  }
}
