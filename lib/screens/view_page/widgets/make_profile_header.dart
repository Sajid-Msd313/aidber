import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'make_column_follow_widget.dart';
import 'make_profile_avatar.dart';
import 'make_title_subtitle_widget.dart';
class make_profile_header extends StatelessWidget {
  const make_profile_header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                const make_profile_avatar(),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: Get.height * .04,
                ),
                Container(
                  width: Get.width - Get.width * .5,
                  height: Get.width * .34,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          make_column_follow(
                            subtitle: "76",
                            heading: "Followers",
                          ),

                          make_column_follow(
                            subtitle: "76",
                            heading: "Followers",
                          ),
                          SizedBox(
                            width: Get.width * .1,
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                          padding: EdgeInsets.only(top: 10),
                          child: make_title_subtitle()),
                      Spacer(),
                    ],
                  ),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}