

import 'package:aidber/global_widgets/appbar.dart';
import 'package:aidber/global_widgets/colors.dart';
import 'package:aidber/screens/menu/widgets/body.dart';
import 'package:aidber/screens/menu/widgets/header.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: PRIMARY_COLOR,

      title: const Text("Menu",style: TextStyle(fontSize: 22),),),
      body: SafeArea(child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
          child: Column(
            children: const [
              headerMenu(),
              bodymenu()
            ],
          ),
        ),
      )),
    );
  }
}