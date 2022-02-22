
import 'package:aidber/screens/login/login_view.dart';
import 'package:aidber/screens/view_page/view_page_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'global_widgets/report_dialog.dart';
import 'menu/navigation_bar/bottom_nav_bar_custom.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      defaultTransition: Transition.cupertino,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        primaryColor: const Color(0xFF282d6b),

      ),
     // home:  Sign_In2(),
      home:  view_page_main_screen(),
    );
  }
}




