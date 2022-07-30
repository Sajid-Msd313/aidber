import 'package:aidber/global_widgets/appbar.dart';
import 'package:aidber/screens/home_screen/widgets/header.dart';
import 'package:aidber/screens/home_screen/widgets/posts_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/home_controller.dart';

class HomeScreenView extends StatelessWidget {
   HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const[
            Expanded(child: PostsList())
          ],
        ),
      ),
    );
  }
}