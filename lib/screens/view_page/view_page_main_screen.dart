import 'package:aidber/screens/home_screen/widgets/make_rounded_text_type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class make_profile_header extends StatelessWidget {
  const make_profile_header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                const make_profile_avatar(),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    make_column_follow(
                      subtitle: "76",
                      heading: "Followers",
                    ),
                    SizedBox(
                      width: Get.width * .1,
                    ),
                    make_column_follow(
                      subtitle: "76",
                      heading: "Followers",
                    ),
                  ],
                ),
                Container(
                  width: Get.width - Get.width * 0.5,
                  child: make_title_subtitle(),
                )
              ],
            ),
          ],
        )
      ],
    );
  }
}

class view_page_main_screen extends StatelessWidget {
  const view_page_main_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(

              height: Get.height * .47,
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
                      top: Get.height * .26, child: make_profile_header()),

                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0,left: 15, right: 15,bottom: 15),
                  child: Text("Lorem Ipsum is test very"*10, maxLines: 2,),
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
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class make_title_subtitle extends StatelessWidget {
  const make_title_subtitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boldstyle = TextStyle(
        color: Get.theme.primaryColor,
        fontWeight: FontWeight.w900,
        wordSpacing: 2,
        fontSize: 28);
    final lightstyle = TextStyle(
        color: Get.theme.primaryColor,
        fontSize: 12,
        fontWeight: FontWeight.w400);

    return Container(
      color: Colors.red,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Text(
              "heading" * 10,
              softWrap: true,
              maxLines: 1,
              style: boldstyle.copyWith(fontSize: 24),
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: Text(
              "subtitle" * 10,
              softWrap: true,
              maxLines: 1,
              style: lightstyle.copyWith(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}

class make_column_follow extends StatelessWidget {
  final String heading;
  final String subtitle;
  final bool isUserName;

  make_column_follow(
      {this.isUserName = false, required this.subtitle, required this.heading});

  final boldstyle = TextStyle(
      color: Get.theme.primaryColor,
      fontWeight: FontWeight.w900,
      wordSpacing: 2,
      fontSize: 28);
  final lightstyle = TextStyle(
      color: Get.theme.primaryColor, fontSize: 12, fontWeight: FontWeight.w400);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: this.isUserName
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        Text(
          heading,
          softWrap: true,
          maxLines: 1,
          style: isUserName ? boldstyle.copyWith(fontSize: 24) : lightstyle,
        ),
        Text(
          subtitle,
          softWrap: true,
          maxLines: 1,
          style: isUserName ? lightstyle.copyWith(fontSize: 16) : boldstyle,
        )
      ],
    );
  }
}

class make_profile_avatar extends StatelessWidget {
  const make_profile_avatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        // Image border
        child: SizedBox.fromSize(
          size: Size.fromRadius(Get.width * .2),
          // Image radius
          child: Image.asset('assets/sajidmsd.jpg', fit: BoxFit.cover),
        ),
      ),
    );
  }
}
