import 'package:flutter/material.dart';
import 'package:get/get.dart';
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