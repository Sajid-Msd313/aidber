import 'package:aidber/global_widgets/colors.dart';
import 'package:aidber/screens/edit_profile/widgets/body.dart';
import 'package:aidber/screens/edit_profile/widgets/header.dart';
import 'package:flutter/material.dart';

class EditPtofile extends StatelessWidget {
  const EditPtofile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        leading: Text(
          'LOGO',
          style: TextStyle(color: Colors.white, fontSize: 20),
          textAlign: TextAlign.center,
        ),
        backgroundColor: PRIMARY_COLOR,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
            children: [
             header(),
              body()
            ],
        ),
      ),
          )),
    );
  }
}
