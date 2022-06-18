import 'package:aidber/global_widgets/colors.dart';
import 'package:aidber/screens/create_a_post/controller/create_post_controller.dart';
import 'package:aidber/screens/create_a_post/widgets/tag_people_search.dart';
import 'package:aidber/utils/styles.dart';
import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/dialog/mult_select_dialog.dart';

class make_selection_optionWidget extends GetView<create_post_controller> {
  const make_selection_optionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> options = [
      'Add Photo/Video',
      'Add Link',
      'Tag People',
      'Add location',
      'Add collaborator'
    ];
    return ChipsChoice<String>.single(
      verticalDirection: VerticalDirection.down,
      direction: Axis.horizontal,
      alignment: WrapAlignment.start,
      value: "",
      onChanged: (val) {
          if(val.contains('Add Photo/Video')){
            controller.open_imageImagePicker(context);
          }else if(val.contains('Add Link')){
            controller.displayLinkinputDialog(context);
          print('add link');
          } else if(val.contains('Add location')){
            controller.open_search_map(context);
          }else if(val.contains('Tag People')){
            controller.showtagPeopleDialog(context);
                  }
          else{

          }
      },
      choiceAvatarBuilder: (_) {
        if (_.label.contains('Add Photo/Video')) {
          return   FaIcon(FontAwesomeIcons.images, color: PRIMARY_COLOR,);
        } else if (_.label.contains('Add Link')) {
          return  FaIcon(FontAwesomeIcons.link,color: PRIMARY_COLOR,);
        } else if (_.label.contains('Tag People')) {
          return  FaIcon(FontAwesomeIcons.userTag,color: PRIMARY_COLOR,);
        }
        else if (_.label.contains('Add location')) {
          return  FaIcon(FontAwesomeIcons.locationDot,color: PRIMARY_COLOR,);
        } else {
          return  FaIcon(FontAwesomeIcons.handshakeSimple,color: PRIMARY_COLOR,);
        }
      },
      choiceItems: C2Choice.listFrom<String, String>(
        source: options,
        value: (i, v) => v,
        label: (i, v) => v,
      ),
      choiceActiveStyle: C2ChoiceStyle(
        color: Get.theme.backgroundColor,
        labelStyle: const TextStyle(fontSize: 18),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      choiceStyle: C2ChoiceStyle(
        showCheckmark: false,
        color: Colors.black,

        labelStyle: kstyle1.copyWith(fontWeight: FontWeight.w500) ,//TextStyle(fontSize: 15,fontWeight: FontWeight.w500),
        backgroundColor: Colors.grey.shade200,
        //padding: EdgeInsets.all(12),
        padding: const EdgeInsets.symmetric(horizontal: 5),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      wrapped: true,
      padding: EdgeInsets.symmetric(horizontal: 0,vertical: 0),
    );
  }
}
