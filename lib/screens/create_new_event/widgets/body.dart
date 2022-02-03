import 'package:aidber/global_widgets/custom_button.dart';
import 'package:aidber/global_widgets/text_fields.dart';
import 'package:flutter/material.dart';

class BodyNewCreateEvent extends StatelessWidget {
  const BodyNewCreateEvent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAuthTextFormField(labeltext: "Event Title",hint: 'Please Enter Your Name',),
          SizedBox(height: 10,),
          CustomAuthTextFormField(hint: 'Organized By',labeltext: "Organized By",),
          SizedBox(height: 10,),
          CustomAuthTextFormField(hint: 'Please Enter Your Venue',labeltext: "Venue",),
          SizedBox(height: 10,),
          CustomAuthTextFormField(hint: 'Please Enter Date',labeltext: "Date",),
          SizedBox(height: 10,),
          CustomAuthTextFormField(hint: 'Please Enter Time',labeltext: "Time"),
          SizedBox(height: 10,),
          CustomMaxTextFormField(hint: 'Please Enter a Description',labeltext: "Description",),
          SizedBox(height: 10,),
          CustomMaxTextFormField(hint: 'Expectation',labeltext: "What to Expect",),
          SizedBox(height: 20,),
          Container(margin: EdgeInsets.symmetric(vertical: 10,horizontal: 40),
              child: CustomButton(btnText: 'Create', primary: true, onPressed: null))
        ],
      ),
    );
  }
}
