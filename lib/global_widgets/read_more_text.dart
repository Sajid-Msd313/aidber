import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
class readMore_textWidget extends StatelessWidget {
final String text;
readMore_textWidget({required this.text});
  @override
  Widget build(BuildContext context) {
    return  ReadMoreText(
      text ,
      trimLines: 2,
      textAlign: TextAlign.start,
      style: const TextStyle(
        color: Colors.black,
      ),
      colorClickableText: Get.theme.primaryColor,
      trimMode: TrimMode.Line,
      trimCollapsedText: 'Show more',
      trimExpandedText: 'Show less',
      lessStyle: TextStyle(
          color: Get.theme.primaryColor, fontWeight: FontWeight.bold),
      moreStyle: TextStyle(
          color: Get.theme.primaryColor, fontWeight: FontWeight.bold),
    );
  }
}
