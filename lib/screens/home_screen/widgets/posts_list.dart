import 'package:aidber/screens/home_screen/widgets/single_post.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostsList extends StatelessWidget {
  const PostsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: Get.height - Get.statusBarHeight,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(4),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) => single_post(),
      ),
    );
  }
}
