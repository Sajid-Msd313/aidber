import 'package:aidber/global_widgets/custom_button.dart';
import 'package:aidber/global_widgets/text_fields.dart';
import 'package:flutter/material.dart';

class body extends StatelessWidget {
  const body({Key? key}) : super(key: key);

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
        TextButton(
            onPressed: () {},
            child: Text(
              "Change your profile",
              style: TextStyle(color: Colors.black, fontSize: 10),
            )),
        Align(alignment: Alignment.centerLeft,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Full Name'),
              SizedBox(height: 5,),
              CustomAuthTextFormField(hint: 'Please Enter Your Name'),
              SizedBox(height: 10,),
              Text('Email'),
              SizedBox(height: 5,),
              CustomAuthTextFormField(hint: 'Please Enter Your Email'),
              SizedBox(height: 10,),
              Text('About'),
              SizedBox(height: 5,),
              CustomMaxTextFormField(hint: 'About us',),
              SizedBox(height: 10,),
              Text('Locattion'),
              SizedBox(height: 5,),
              CustomAuthTextFormField(hint: 'Search your Location'),
              SizedBox(height: 10,),
              CustomButton(btnText: 'Save', primary: true, onPressed: null)
            ],
          ),
        )
      ],
    );
  }
}
