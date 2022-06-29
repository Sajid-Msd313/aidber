import 'package:aidber/global_widgets/custom_button.dart';
import 'package:aidber/global_widgets/text_fields.dart';
import 'package:aidber/screens/edit_profile/controllers/editProfile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class bodyEditProfile extends StatelessWidget {
  const bodyEditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20), // Image border
          child: SizedBox.fromSize(
            size: Size.fromRadius(48), // Image radius
            child: Image.asset('assets/sajidmsd.jpg', fit: BoxFit.cover),
          ),
        ),
        Text(
          "Change your profile",
          style: TextStyle(color: Colors.black, fontSize: 12),
        ),
        GetBuilder<editProfile_controller>(
          init: editProfile_controller(),
          builder: (controller) {
            return Form(
              key: controller.formKey,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  CustomAuthTextFormField(
                    controller: controller.fullnameC,
                    labeltext: "Full name",hint: 'Please Enter Your Name',),
                  SizedBox(height: 10,),
                  CustomAuthTextFormField(
                    controller: controller.emailC,
                    hint: 'Please Enter Your Email',labeltext: "Email",),
                  SizedBox(height: 10,),
                  CustomAuthTextFormField(
                    controller: controller.phoneC,
                    hint: 'Please Enter Your Phone No',labeltext: "Phone",),
                  SizedBox(height: 10,),
                  CustomAuthTextFormField(
                    controller: controller.locationC,
                    hint: 'Please Enter Your Location',labeltext: "Location",),
                  SizedBox(height: 10,),
                  CustomAuthTextFormField(
                    controller: controller.occupationC,
                    hint: 'Please Enter Your Occupation',labeltext: "Occupation",),
                  SizedBox(height: 10,),
                  CustomAuthTextFormField(
                      controller: controller.workC,
                      hint: 'Your Work',labeltext: "Work"),
                  SizedBox(height: 10,),
                  CustomMaxTextFormField(
                    controller: controller.aboutC,
                    hint: 'About us',labeltext: "About",),
                  controller.isLoading? Center(child: CircularProgressIndicator(),) : CustomButton(btnText: 'Save', primary: true, onPressed: controller.validateFields)
                ],
              ),
            );
          }
        )
      ],
    );
  }
}
