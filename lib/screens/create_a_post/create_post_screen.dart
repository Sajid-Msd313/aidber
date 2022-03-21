
import 'package:aidber/global_widgets/custom_button.dart';
import 'package:aidber/screens/create_a_post/controller/create_post_controller.dart';
import 'package:aidber/screens/create_a_post/widgets/make_profileImage_and_name.dart';
import 'package:aidber/screens/create_a_post/widgets/make_select_optionWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/make_category_selection_chips.dart';
import '../../utils/utils.dart';
class create_post_screen extends GetView<create_post_controller> {
  const create_post_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("Create Post",style: kstyleAppBar,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            key: controller.formKey,
            child: Column(children: [
              SizedBox(height: 20,),
              make_profileImage_name(),
              SizedBox(height: 20,),
              Container(
            padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                child: Center(
                  child:  TextFormField(
                    maxLines: 6,
                    validator: (_){
                      if(_!.isEmpty){
                        return "Please write something";
                      }
                    },
                    controller:controller.captionField ,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      focusColor: Colors.grey,
                      hintText: 'Share your thoughts...',
                      hintStyle: kHintStyle,
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
              make_selection_optionWidget(),
              make_category_selection_chips(),
              SizedBox(height: 8,),
              SizedBox(
                  width: Get.width*.8,
                  child: CustomButton(btnText: "Post", primary: true, onPressed: (){
                    controller.validate();
                  },showShadow: false,))
            ],),
          ),
        ),
      ),
    );
  }
}
