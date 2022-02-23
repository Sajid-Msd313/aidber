import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      //  width: Get.width*.5,
      //  color: Colors.red,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Page Title lorem" ,
            //  softWrap: true,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: boldstyle.copyWith(fontSize: 22),
          ),
          Text(
            "subtitle is good and it is very good very good" *1,
            //  softWrap: true,
            overflow: TextOverflow.clip,
            maxLines:2,
            style: lightstyle.copyWith(fontSize: 15, color: Colors.black),
          )
        ],
      ),
    );
  }
}