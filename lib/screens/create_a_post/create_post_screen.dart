import 'package:aidber/global_widgets/custom_button.dart';
import 'package:aidber/screens/create_a_post/controller/create_post_controller.dart';
import 'package:aidber/screens/create_a_post/widgets/make_profileImage_and_name.dart';
import 'package:aidber/screens/create_a_post/widgets/make_select_optionWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../global_widgets/image_view_widget.dart';
import '../../utils/styles.dart';
import 'widgets/make_category_selection_chips.dart';

class create_post_screen extends GetView<create_post_controller> {
  const create_post_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text(
          "Create Post",
          style: kstyleAppBar,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                 make_profileImage_name(
                   callBackRemoveLink: controller.clearLink,
                   callBackRemoveAddress: controller.clearAddress,),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: Center(
                    child: TextFormField(
                      maxLines: 6,
                      validator: (_) {
                        if (_!.isEmpty) {
                          return "Please write something";
                        }
                      },
                      controller: controller.captionField,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        focusColor: Colors.grey,
                        hintText: 'Share your thoughts...',
                        hintStyle: kHintStyle.copyWith(fontSize: 16),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                make_category_selection_chips(),
                const make_selection_optionWidget(),
                const SizedBox(
                  height: 8,
                ),
          /*    Obx((){
                if(controller.pickedImagesPath.isNotEmpty){
                  ListView.builder(itemBuilder: (context, index){
                    return  image_view_widget(
                      imageFilePath: controller.pickedImagesPath[index],
                      height: MediaQuery.of(context).size.height*.3,
                      callBack: ()=>controller.clearImage(path: controller.pickedImagesPath[index]),
                    );
                  });
                }
                return Center(
                    child: Text("Not Selected"));
              })*/
                GetBuilder<create_post_controller>(
                    init: Get.find<create_post_controller>(),
                    builder: (controller){
                 return      Obx(()=>
                 controller.pickedImagesPath.isNotEmpty?  Container(
                   alignment: Alignment.center,
                       height:  MediaQuery.of(context).size.height*.3,
                       child: ListView.builder(
                         padding: const EdgeInsets.symmetric(horizontal: 8),
                         itemCount: controller.pickedImagesPath.length,
                           shrinkWrap: true,
                           scrollDirection: Axis.horizontal,
                           itemBuilder: (context, index){
                         return  Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: image_view_widget(
                             imageFilePath: controller.pickedImagesPath[index],
                             height: MediaQuery.of(context).size.height*.3,
                             callBack: ()=>controller.clearImage(path: controller.pickedImagesPath[index]),
                           ),
                         );
                       }),
                     ) : Container(),
                   );
                })
                , SizedBox(
                  height: 8,
                ),
                SizedBox(
                    // width: Get.width * .8,
                    child: CustomButton(
                  btnText: "Post",
                  primary: true,
                  onPressed: () {
                    controller.validate();
                  },
                  showShadow: false,
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
