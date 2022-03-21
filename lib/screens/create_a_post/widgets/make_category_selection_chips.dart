import 'package:aidber/screens/create_a_post/controller/create_post_controller.dart';
import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class make_category_selection_chips extends GetView<create_post_controller> {

  List<String> options = [
    'News', 'Entertainment', 'Politics',
    'Automotive', 'Sports', 'Education',
    'Fashion', 'Travel', 'Food', 'Tech',
    'Science',
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<create_post_controller>(
        init: Get.find<create_post_controller>(),
        builder: (controller){

      return ChipsChoice<String>.single(
        value: controller.post_categoryField,
        onChanged: (val) {
          controller.post_categoryField = val;
        },
        choiceItems: C2Choice.listFrom<String, String>(
          source: options,
          value: (i, v) => v,
          label: (i, v) => v,
        ),
        choiceActiveStyle: C2ChoiceStyle(
          color: Get.theme.backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        choiceStyle: C2ChoiceStyle(
          showCheckmark: false,
          color: Colors.black,
          backgroundColor: Colors.grey.shade200,
          labelStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        wrapped: true,
      );
    });
  }
}
