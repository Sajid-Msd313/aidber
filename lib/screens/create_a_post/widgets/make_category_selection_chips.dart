import 'package:aidber/global_widgets/colors.dart';
import 'package:aidber/screens/create_a_post/controller/create_post_controller.dart';
import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/AppData.dart';
class make_category_selection_chips extends GetView<create_post_controller> {



  @override
  Widget build(BuildContext context) {
    return GetBuilder<create_post_controller>(
        init: Get.find<create_post_controller>(),
        builder: (controller){

      return ChipsChoice<String>.single(
        crossAxisAlignment: CrossAxisAlignment.start,
        padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 2),
        value: controller.post_categoryField,
        onChanged: (val) {
          controller.post_categoryField = val;
        },
        choiceItems: C2Choice.listFrom<String, String>(
          source: category,
          value: (i, v) => v,
          label: (i, v) => v,
        ),
        choiceActiveStyle: C2ChoiceStyle(
          showCheckmark: true,
          color: PRIMARY_COLOR,

          backgroundColor: Colors.grey.shade200,
          labelStyle: const TextStyle(fontSize: 13,fontWeight: FontWeight.bold),

          borderRadius: BorderRadius.all(const Radius.circular(10)),
        ),
        choiceStyle: C2ChoiceStyle(
          showCheckmark: false,
          color: Colors.black,
          backgroundColor: Colors.grey.shade200,
          labelStyle: const TextStyle(fontSize: 13,fontWeight: FontWeight.w500),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        wrapped: true,
      );
    });
  }
}