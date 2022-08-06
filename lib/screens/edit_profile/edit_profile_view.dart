import 'package:aidber/global_widgets/appbar.dart';
import 'package:aidber/global_widgets/colors.dart';
import 'package:aidber/screens/edit_profile/widgets/body.dart';
import 'package:aidber/screens/edit_profile/widgets/header.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:CustomAppbar,
      body: SingleChildScrollView(
        child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
        children: const [
         // headerEditProfile(),
          bodyEditProfile()
        ],
        ),
      ),
      ),
    );
  }
}