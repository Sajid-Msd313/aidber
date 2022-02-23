import 'package:flutter/material.dart';
import 'package:get/get.dart';
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