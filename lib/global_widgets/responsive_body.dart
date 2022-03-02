import 'package:flutter/material.dart';
import 'package:get/get.dart';
class responsive_body extends StatelessWidget {
  Widget child;
  responsive_body({required this.child});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(

          height: Get.height,
          child: Row(
        children: [
          SizedBox(width: Get.width*.05,),

          Container(

            width: Get.width*.9,child: child,),

          SizedBox(width: Get.width*.05,),
        ],
      ),)
    );
  }
}
