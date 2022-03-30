import 'package:aidber/global_widgets/colors.dart';
import 'package:aidber/global_widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Recover_Password extends StatefulWidget {
  const Recover_Password({Key? key}) : super(key: key);

  @override
  _Recover_PasswordState createState() => _Recover_PasswordState();
}

class _Recover_PasswordState extends State<Recover_Password> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (_, constraints) {
          print("height: "  + constraints.maxHeight.toString());
          print("width: "  + constraints.maxWidth.toString());

          final width = constraints.biggest.width;
          final height = constraints.biggest.height;
          return SingleChildScrollView(
            child: SizedBox(
              height: height,
              child: Stack(
                children: [

                  Positioned(
                    top: height *.09,
                    left: 0,
                    right: width*.85,
                    child: InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: PRIMARY_COLOR,
                      ),
                    ),
                  ),
                  Positioned(
                    top: height *.15,
                    left: width *.05,
                    right: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Recover your password',
                          style: TextStyle(
                              color: PRIMARY_COLOR,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: height * .32,
                    left: width * .05,
                    width: width *.9,
                    child: Container(
                      decoration: BoxDecoration(
                          // color: PRIMARY_COLOR,
                          borderRadius: BorderRadius.circular(15.0),
                         ),
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey.shade300,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(13)),
                                prefixIcon: const Icon(Icons.contact_mail),
                                labelText: '| Email',
                                enabled: true),
                            enabled: true,
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                         CustomButton(btnText: "Recover Password", primary: true, onPressed: (){},showShadow: false,)

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

