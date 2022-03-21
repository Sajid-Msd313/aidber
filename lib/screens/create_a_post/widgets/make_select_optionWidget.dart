import 'package:aidber/screens/create_a_post/controller/create_post_controller.dart';
import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class make_selection_optionWidget extends GetView<create_post_controller> {
  const make_selection_optionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> options = [
      'Add Photo/Video',
      'Tag People',
      'Add location',
      'Add collaborator'
    ];
    return ChipsChoice<String>.single(
      value: "",
      onChanged: (val) {
          if(val.contains('Add Photo/Video')){
            controller.open_imageImagePicker(context);
          }else if(val.contains('Add location')){
            controller.open_search_map(context);
          }else if(val.contains('Tag People')){

          }else{

          }
      },
      choiceAvatarBuilder: (_) {
        if (_.label.contains('Add Photo/Video')) {
          return Icon(Icons.add_a_photo);
        } else if (_.label.contains('Tag People')) {
          return Icon(Icons.people_alt_outlined);
        } else if (_.label.contains('Add location')) {
          return Icon(Icons.location_on_outlined);
        } else {
          return Icon(Icons.menu_book);
        }
      },
      choiceItems: C2Choice.listFrom<String, String>(
        source: options,
        value: (i, v) => v,
        label: (i, v) => v,
      ),
      choiceActiveStyle: C2ChoiceStyle(
        color: Get.theme.backgroundColor,
        labelStyle: TextStyle(fontSize: 18),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      choiceStyle: C2ChoiceStyle(
        showCheckmark: false,
        color: Colors.black,

        labelStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),
        backgroundColor: Colors.grey.shade200,
        padding: EdgeInsets.all(12),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      wrapped: true,
    );
  }
}
