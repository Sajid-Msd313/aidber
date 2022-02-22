import 'package:aidber/global_widgets/single_post.dart';
import 'package:aidber/screens/home_screen/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostsList extends StatelessWidget {
   PostsList({Key? key}) : super(key: key);

  final a = Get.create(() => home_controller());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: Get.height - Get.statusBarHeight,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(4),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) => const single_post(),
      ),
    );
  }
}
