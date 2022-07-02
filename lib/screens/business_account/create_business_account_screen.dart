import 'package:aidber/global_widgets/custom_button.dart';
import 'package:aidber/screens/business_account/controllers/create_business_controller.dart';
import 'package:aidber/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../global_widgets/appbar.dart';

class create_business_accountview extends GetView<create_business_controller> {
  const create_business_accountview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Create Business Account",
      ),
      body: Form(
        key: controller.formKey,
        child: ListView(
          padding: const EdgeInsets.only(left: 10, right: 20),
          children: [
            const SizedBox(
              height: 20,
            ),
            profileWidget(),
            TextFieldBusinessAccount(
              controller: controller.businessNameC,
              hintText: "Business Name",
              validator: (_){
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
              validator: (_){
                if(GetUtils.isURL(_) == false || _!.toString().contains("http") == false){
                  return 'Please Enter Valid Url';
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
              icon: FontAwesomeIcons.users,
            ),
            TextFieldBusinessAccount(
              controller: controller.phoneNumberC,
              hintText: "Phone Number",
              icon: FontAwesomeIcons.phone,
            ),
            TextFieldBusinessAccount(
              controller: controller.yearOfFoundationC,
              hintText: "Year of Foundation",
              icon: FontAwesomeIcons.calendar,
            ),
            TextFieldBusinessAccount(
              controller: controller.aboutC,
              hintText: "About",
              icon: FontAwesomeIcons.edit,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: CustomButton(
                  btnText: "Create", primary: true, onPressed: () => {
                    FocusScope.of(context).unfocus(),
                controller.validate(),
              }),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget TextFieldBusinessAccount({
    required TextEditingController controller,
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
          Expanded(child: isIcon ? Icon(icon, color: Get.theme.primaryColor,) : FaIcon(icon, color: Get.theme.primaryColor,)),
          Expanded(
            flex: 8,
            child: TextFormField(
              controller: controller,
              validator: validator,
              decoration: InputDecoration(
                  labelText: labelText,
                  hintText: hintText,
                  border: const UnderlineInputBorder()),
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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.network(constans.DEFAULT_IMAGE),
          )),
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
