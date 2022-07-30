import 'package:flutter/material.dart';
import 'package:get/get.dart';
class make_column_follow extends StatelessWidget {
  final String heading;
  final String subtitle;
  final bool isUserName;
  final Color? textColor;
final CrossAxisAlignment? crossAxisAlignment;
  make_column_follow(
      {this.isUserName = false, required this.subtitle, required this.heading, this.textColor, this.crossAxisAlignment});



  @override
  Widget build(BuildContext context) {
    final boldstyle = TextStyle(
        color: textColor ?? Get.theme.primaryColor ,
        fontWeight: FontWeight.w700,
        wordSpacing: 2,
        fontSize: 28);
    final lightstyle = TextStyle(
        color:textColor?? Get.theme.primaryColor, fontSize: 12, fontWeight: FontWeight.w500);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: crossAxisAlignment == null?  isUserName || textColor==null
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center :CrossAxisAlignment.start,
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