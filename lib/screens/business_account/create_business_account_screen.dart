import 'package:aidber/global_widgets/custom_button.dart';
import 'package:aidber/screens/business_account/controllers/create_business_controller.dart';
import 'package:aidber/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../global_widgets/appbar.dart';

class CreateBusinessAccountScreen extends GetView<CreateBusinessController> {
  final bool isEditMode;

  const CreateBusinessAccountScreen({Key? key, this.isEditMode = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: isEditMode ? "Edit Business Account" : "Create Business Account",
      ),
      body: Form(
        key: controller.formKey,
        child: ListView(
          padding: const EdgeInsets.only(left: 10, right: 20),
          children: [
            const SizedBox(
              height: 20,
            ),
          //  profileWidget(),
            TextFieldBusinessAccount(
              controller: controller.businessNameC,
              hintText: "Business Name",
              validator: (_) {
                if (_!.isEmpty) {
                  return 'Please Fill This Field';
                }
                return null;
              },
              icon: FontAwesomeIcons.briefcase,
            ),
            TextFieldBusinessAccount(
              controller: controller.businessTaglineC,
              hintText: "Business Tagline",
              icon: FontAwesomeIcons.tag,
            ),
            TextFieldBusinessAccount(
              controller: controller.websiteC,
              hintText: "Website url",
              icon: FontAwesomeIcons.globe,
              validator: (_) {
                if (GetUtils.isURL(_) == false || _!.toString().contains("http") == false) {
                  return 'Url must start with http/https';
                }
                return null;
              },
            ),
            TextFieldBusinessAccount(
              controller: controller.industryC,
              hintText: "Industry",
              icon: FontAwesomeIcons.industry,
            ),
            TextFieldBusinessAccount(
              controller: controller.locationC,
              hintText: "Location",
              icon: FontAwesomeIcons.locationDot,
            ),
            TextFieldBusinessAccount(
              controller: controller.companySizeC,
              hintText: "Company Size",
              textInputType: const TextInputType.numberWithOptions(),
              icon: FontAwesomeIcons.users,
            ),
            TextFieldBusinessAccount(
              controller: controller.phoneNumberC,
              textInputType: const TextInputType.numberWithOptions(),
              hintText: "Phone Number",
              icon: FontAwesomeIcons.phone,
            ),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    final Size size = MediaQuery.of(context).size;
                    return AlertDialog(
                      title: Text('Select a Year'),
                      // Changing default contentPadding to make the content looks better

                      contentPadding: const EdgeInsets.all(10),
                      content: SizedBox(
                        // Giving some size to the dialog so the gridview know its bounds

                        height: size.height / 3,
                        width: size.width,
                        //  Creating a grid view with 3 elements per line.
                        child: GridView.count(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          children: [
                            ...List.generate(
                              100,
                              (index) => InkWell(
                                onTap: () {
                                  controller.yearOfFoundationC.text = (2022 - index).toString();

                                  Navigator.pop(context);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Chip(
                                    label: Container(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        (2022 - index).toString(),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: TextFieldBusinessAccount(
                isEnabled: false,
                controller: controller.yearOfFoundationC,
                hintText: "Year of Foundation",
                textInputType: const TextInputType.numberWithOptions(),
                icon: FontAwesomeIcons.calendar,
              ),
            ),
            TextFieldBusinessAccount(
              controller: controller.aboutC,
              hintText: "About",
              icon: FontAwesomeIcons.edit,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: CustomButton(
                  btnText: isEditMode ? "Update" : "Create",
                  primary: true,
                  onPressed: () => {
                        FocusScope.of(context).unfocus(),
                        controller.validate(isEdit: isEditMode),
                      }),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget TextFieldBusinessAccount({
    required TextEditingController controller,
    bool isEnabled = true,
    TextInputType? textInputType,
    String? labelText,
    validator,
    required String hintText,
    required IconData icon,
    bool isIcon = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
              child: isIcon
                  ? Icon(
                      icon,
                      color: Get.theme.primaryColor,
                    )
                  : FaIcon(
                      icon,
                      color: Get.theme.primaryColor,
                    )),
          Expanded(
            flex: 8,
            child: TextFormField(
              enabled: isEnabled,
              readOnly: !isEnabled,
              controller: controller,
              validator: validator,
              keyboardType: textInputType,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: labelText, hintText: hintText, border: const UnderlineInputBorder()),
            ),
          ),
        ],
      ),
    );
  }

  Widget profileWidget() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
              child: Container(
                  height: 180,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Image.network(constans.DEFAULT_IMAGE))),
          TextButton(
            style: TextButton.styleFrom(
              minimumSize: Size.zero, // Set this
              padding: EdgeInsets.zero,
            ),
            onPressed: () {},
            child: const Text(
              "Upload display picture",
              style: TextStyle(fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}