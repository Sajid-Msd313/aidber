import 'package:aidber/global_widgets/custom_button.dart';
import 'package:aidber/global_widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            CustomAuthTextFormField(labeltext: "Full name",hint: 'Please Enter Your Name',),
            SizedBox(height: 10,),
            CustomAuthTextFormField(hint: 'Please Enter Your Email',labeltext: "Email",),
            SizedBox(height: 10,),
            CustomAuthTextFormField(hint: 'Please Enter Your Location',labeltext: "Location",),
            SizedBox(height: 10,),
            CustomAuthTextFormField(hint: 'Please Enter Your Occupation',labeltext: "Occupation",),
            SizedBox(height: 10,),
            CustomAuthTextFormField(hint: 'Your Work',labeltext: "Work"),
            SizedBox(height: 10,),
            CustomMaxTextFormField(hint: 'About us',labeltext: "About",),
            CustomButton(btnText: 'Save', primary: true, onPressed: null)
          ],
        )
      ],
    );
  }
}
