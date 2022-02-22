import 'package:aidber/screens/home_screen/widgets/make_rounded_text_type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class view_page_main_screen extends StatelessWidget {
  const view_page_main_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.grey.withOpacity(.1),
              height: Get.height * .6,
              child: Stack(
                children: [
                  Image.asset(
                    "assets/cover_photo.jpg",
                    fit: BoxFit.fitWidth,
                    height: Get.height * .3,
                  ),
                  Positioned(
                      top: Get.height * .02,
                      left: 0,
                      child: InkWell(
                        onTap: () {
                          print("get back");
                          Get.back();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "assets/back.png",
                            color: Colors.white,
                            height: 30,
                          ),
                        ),
                      )),
                  Positioned(
                      bottom: Get.height * .15,

                      child: Row(

                        mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              // Image border
                              child: SizedBox.fromSize(
                                size: Size.fromRadius(Get.width * .2),
                                // Image radius
                                child: Image.asset('assets/sajidmsd.jpg',
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),

                          Column(
                            children: [
                              SizedBox(height: Get.height*.05,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  make_column_follow(
                                  subtitle: "76",
                                  heading: "Followers",
                                ),
                         SizedBox(width: Get.width*.1,),
                                make_column_follow(
                                  subtitle: "76",
                                  heading: "Followers",
                                ),
                              ],),
                            ],
                          ),

                        ],
                      ))
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                make_rounded_text_type(
                  text: "Follow",
                ),
                make_rounded_text_type(
                  text: "Message",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class make_column_follow extends StatelessWidget {
  final String heading;
  final String subtitle;
  final bool isUserName;

  make_column_follow({ this.isUserName = false,required this.subtitle, required this.heading});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Column(
        children: [
          Text(
            heading,
            style: TextStyle(color: Get.theme.primaryColor, fontSize: 12, fontWeight: FontWeight.w400),
          ),
          Text(
            subtitle,
            style: TextStyle(
                color: Get.theme.primaryColor,
                fontWeight: FontWeight.w900,
                fontSize: 32),
          )
        ],
      ),
    );
  }
}
