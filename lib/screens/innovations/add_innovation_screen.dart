import 'package:aidber/global_widgets/custom_button.dart';
import 'package:aidber/global_widgets/custom_dropDown.dart';
import 'package:aidber/global_widgets/text_fields.dart';
import 'package:aidber/screens/innovations/controller/AddInnovationController.dart';
import 'package:aidber/utils/AppData.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

import '../../global_widgets/colors.dart';
import '../../global_widgets/image_view_widget.dart';

class AddInnovationScreen extends GetView<AddInnovationController> {
  const AddInnovationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR,
        elevation: 0,
        title: const Text('Add Innovation', style: TextStyle(color: Colors.white, fontSize: 20), textAlign: TextAlign.center),
      ),
      body: Form(
        key: controller.formKey,
        child: ListView(
          children: [
            const SizedBox(height: 12),
            _TitleWithChild(
                title: "Title", child: CustomAuthTextFormField(hint: "Please enter title", controller: controller.titleC)),
            _TitleWithChild(
                title: "Select Category",
                child: InkWell(
                  child: CustomAuthTextFormField(
                      readOnly: true,
                      controller: controller.categoryC,
                      hint: "Please select category",
                      suffixIcon: CustomDropDownPopup(
                          isIconCenter: true,
                          dropDownList: category,
                          onSelected: controller.onCategorySelected,
                          iconData: Icons.arrow_drop_down)),
                )),
            _TitleWithChild(
                title: "Add Link",
                child: CustomAuthTextFormField(
                    hint: "Add Link here",
                    controller: controller.linkC,
                    validator: (_) {
                      if (!GetUtils.isURL(_) || !_.toString().contains("http")) {
                        return "Valid url starts with http://";
                      }
                    })),
            _TitleWithChild(
                title: "Description", child: CustomMaxTextFormField(hint: 'Enter Description', controller: controller.descriptionC)),
            GetBuilder<AddInnovationController>(
                builder: (controller) => Column(children: [
                      controller.pickedImage != null
                          ? image_view_widget(
                              imageFilePath: controller.pickedImage?.path,
                              height: MediaQuery.of(context).size.height * .3,
                              callBack: () => controller.removeImage(),
                            )
                          : _MakeIconWithText(
                              text: "Add Photo/Video",
                              icon: FontAwesomeIcons.images,
                              onTap: () => controller.openImagePicker(context)),
                      const SizedBox(height: 6),
                      controller.pickedFile != null
                          ? selectedFileWidget(controller)
                          : _MakeIconWithText(
                              text: "Attach Document", icon: FontAwesomeIcons.paperclip, onTap: () => controller.openFilePicker()),
                      const SizedBox(height: 40),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: CustomButton(btnText: "Publish", primary: true, onPressed: () => _submit(context))),
                    ])),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  void _submit(BuildContext context) {
    FocusScope.of(context).unfocus();
    controller.validateFields();
  }
}

Align selectedFileWidget(controller) {
  return Align(
      alignment: controller.pickedImage == null ? Alignment.centerLeft : Alignment.center,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: RichText(
              text: TextSpan(
                  text: "Document Attached: ",
                  style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
                  children: [
                TextSpan(
                    text: basename(controller.pickedFile!.path),
                    style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
                WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: IconButton(
                        splashRadius: 20,
                        icon: Icon(Icons.cancel, color: Colors.grey.withOpacity(0.5), size: 18),
                        onPressed: controller.removeFileCallBack))
              ]))));
}

class _MakeIconWithText extends StatelessWidget {
  final String text;
  final IconData icon;
  final onTap;

  const _MakeIconWithText({Key? key, required this.text, required this.icon, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          FaIcon(icon, color: PRIMARY_COLOR),
          TextButton(
              onPressed: onTap,
              child: Text(text,
                  style: const TextStyle(color: Colors.black, fontSize: 12, fontFamily: 'Poppins', fontWeight: FontWeight.w500)))
        ],
      ),
    );
  }
}

class _TitleWithChild extends StatelessWidget {
  final String title;
  final Widget child;

  const _TitleWithChild({Key? key, required this.title, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: const TextStyle(fontFamily: "Poppins", fontSize: 12, fontWeight: FontWeight.w600, color: Colors.grey)),
          child,
          const SizedBox(height: 24),
        ]));
  }
}