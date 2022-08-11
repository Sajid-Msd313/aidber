import 'dart:io';

import 'package:aidber/screens/fund_raiser/controllers/add_fund_raiser_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../global_widgets/custom_button.dart';
import '../../global_widgets/custom_dropDown.dart';
import '../../global_widgets/text_fields.dart';

class AddFundRaiserScreen extends GetView<AddFundRaiserController> {
  const AddFundRaiserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle hintStyle = TextStyle(fontSize: 12, color: Colors.grey.shade400);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text("Request For Funds", style: TextStyle(fontSize: 26, color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: Form(
        key: controller.formKey,
        child: ListView(
          children: [
            // Align(alignment: Alignment.center, child: Text("Found Heal", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold))),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Align(
                  alignment: Alignment.center,
                  child: Text("To put up fundraiser request provide the following details",
                      textAlign: TextAlign.center, style: TextStyle(fontSize: 14))),
            ),
            const SizedBox(height: 16),
            TitleWithChild(
                title: "Title",
                child: CustomAuthTextFormField(hint: "Enter title", controller: controller.titleC, hintStyle: hintStyle)),
            TitleWithChild(
                title: "Description of funding",
                child: CustomAuthTextFormField(
                    hintStyle: hintStyle, hint: "Describe the funding in detail", controller: controller.descriptionC)),
            TitleWithChild(
                title: "Name of Organization or User",
                child: CustomAuthTextFormField(
                    hint: "Request put by (name of user or "
                        "organization)",
                    hintStyle: hintStyle,
                    controller: controller.requestNameC)),
            TitleWithChild(
                title: "Amount",
                child: CustomAuthTextFormField(
                    textInputType: const TextInputType.numberWithOptions(decimal: false),
                    hintStyle: hintStyle,
                    hint: "Amount Required",
                    controller: controller.amountC)),
            TitleWithChild(
                title: "Select Account",
                child: InkWell(
                    child: CustomAuthTextFormField(
                        readOnly: true,
                        controller: controller.accountC,
                        hint: "Select Account",
                        hintStyle: hintStyle,
                        suffixIcon: CustomDropDownPopup(
                            isIconCenter: true,
                            dropDownList: controller.accountList,
                            onSelected: (value) {
                              controller.accountC.text = controller.accountList[value];
                            },
                            iconData: Icons.arrow_drop_down)))),
            TitleWithChild(
                title: "Bank Account Number",
                child: CustomAuthTextFormField(
                    textInputType: const TextInputType.numberWithOptions(decimal: false),
                    hintStyle: hintStyle,
                    hint: "Please Enter Bank Account Number",
                    controller: controller.bankNumberC)),
            _SelectedImagesAndVideos(),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: CustomButton4(
                    onTap: controller.createFundRaiser,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    text: 'Submit',
                    fontSize: 16,
                    width: MediaQuery.of(context).size.width * .5,
                    color: Theme.of(context).primaryColor,
                    disableBorder: true)),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  _SelectedImagesAndVideos() {
    return GetBuilder<AddFundRaiserController>(
        // init: AddFundRaiserController(),
        builder: (controller) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleWithChild(
              title: "Show Case Images",
              child: SizedBox(
                  height: 100,
                  child: controller.caseImages.isEmpty
                      ? InkWell(
                          onTap: controller.pickImages,
                          child: Container(
                            margin: const EdgeInsets.only(top: 10),
                            color: Colors.grey,
                            height: 100,
                            width: 100,
                            child: const Icon(Icons.add, color: Colors.white),
                          ),
                        )
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.caseImages.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) => Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Container(
                                margin: const EdgeInsets.only(top: 10),

                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  image: DecorationImage(
                                    image: FileImage(File(controller.caseImages[index].path)),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                // child: const Icon(Icons.add, color: Colors.white),
                              ))))),
          TitleWithChild(
              title: "Show Case Videos",
              child: SizedBox(
                height: 100,
                child: controller.caseVideosPath.isEmpty
                    ? InkWell(
                        onTap: controller.pickVideos,
                        child: Container(
                            margin: const EdgeInsets.only(top: 10),
                            color: Colors.grey,
                            height: 100,
                            width: 100,
                            child: const Icon(Icons.add, color: Colors.white)),
                      )
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.caseVideosPath.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) => Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  color: Colors.grey,
                                  height: 100,
                                  width: 100,
                                  child: const Icon(Icons.video_collection_outlined, color: Colors.white)),
                            )),
              )),
        ],
      );
    });
  }
}

class TitleWithChild extends StatelessWidget {
  final String title;
  final Widget child;
  final TextStyle? titleStyle;

  const TitleWithChild({Key? key, required this.title, required this.child, this.titleStyle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title,
              style:
                  titleStyle ?? const TextStyle(fontFamily: "Poppins", fontSize: 12, fontWeight: FontWeight.w600, color: Colors.grey)),
          child,
          const SizedBox(height: 24),
        ]));
  }
}