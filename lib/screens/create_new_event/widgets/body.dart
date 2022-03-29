import 'package:aidber/global_widgets/custom_button.dart';
import 'package:aidber/global_widgets/text_fields.dart';
import 'package:flutter/material.dart';

class BodyNewCreateEvent extends StatelessWidget {
  const BodyNewCreateEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAuthTextFormField(labeltext: "Event Title",hint: 'Please Enter Your Name',),
          const SizedBox(height: 10,),
          const CustomAuthTextFormField(hint: 'Organized By',labeltext: "Organized By",),
          const SizedBox(height: 10,),
          const CustomAuthTextFormField(hint: 'Please Enter Your Venue',labeltext: "Venue",),
          const SizedBox(height: 10,),
          const CustomAuthTextFormField(hint: 'Please Enter Date',labeltext: "Date",),
          const SizedBox(height: 10,),
          const CustomAuthTextFormField(hint: 'Please Enter Time',labeltext: "Time"),
          const SizedBox(height: 10,),
          const CustomMaxTextFormField(hint: 'Please Enter a Description',labeltext: "Description",),
          const SizedBox(height: 10,),
          const CustomMaxTextFormField(hint: 'Expectation',labeltext: "What to Expect",),
          const SizedBox(height: 20,),
          Container(margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 40),
              child: const CustomButton(btnText: 'Create', primary: true, onPressed: null))
        ],
      ),
    );
  }
}
