import 'package:aidber/global_widgets/custom_button.dart';
import 'package:aidber/screens/create_a_post/controller/create_post_controller.dart';
import 'package:aidber/screens/create_a_post/widgets/make_profileImage_and_name.dart';
import 'package:aidber/screens/create_a_post/widgets/make_select_optionWidget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../global_widgets/colors.dart';
import '../../global_widgets/image_view_widget.dart';
import '../../utils/dimensions.dart';
import '../../utils/styles.dart';
import 'widgets/make_category_selection_chips.dart';

class create_post_screen extends GetView<create_post_controller> {
  //for business post...
  final String? businessId;
  final String? businessName;

  const create_post_screen({Key? key, this.businessId, this.businessName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: PRIMARY_COLOR,
        title:  Text(
          businessId!=null?"Create A Business Post" :   "Create Post",
          style: kstyleAppBar,
        ),
        actions: [
          IconButton(
              onPressed: () => controller.validate(businessId: businessId),
              icon: const FaIcon(FontAwesomeIcons.check, color: Colors.white)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Visibility(
                  visible: businessId != null,
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 1),
                      child: RichText(text: TextSpan(
                        text: "You're Posting as ",
                        style: const TextStyle(color: Colors.black, fontSize: 14),
                        children: [
                          TextSpan(
                            text: " $businessName",
                            style: const TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),),


                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                make_profileImage_name(
                  businessName: businessName,
                  callBackRemoveLink: controller.clearLink,
                  callBackRemoveAddress: controller.clearAddress,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
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
                GetBuilder<create_post_controller>(
                    init: Get.find<create_post_controller>(),
                    builder: (controller) {
                      return Obx(
                        () => controller.pickedImagesPath.isNotEmpty
                            ? Container(
                                alignment: Alignment.center,
                                height: MediaQuery.of(context).size.height * .3,
                                child: ListView.builder(
                                    padding: const EdgeInsets.symmetric(horizontal: 8),
                                    itemCount: controller.pickedImagesPath.length,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: image_view_widget(
                                          imageFilePath: controller.pickedImagesPath[index],
                                          height: MediaQuery.of(context).size.height * .3,
                                          callBack: () => controller.clearImage(path: controller.pickedImagesPath[index]),
                                        ),
                                      );
                                    }),
                              )
                            : Container(),
                      );
                    }),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                    // width: Get.width * .8,
                    child: CustomButton(
                  btnText: "Post",
                  primary: true,
                  onPressed: () {
                    controller.validate(businessId: businessId);
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