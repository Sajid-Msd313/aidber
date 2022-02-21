import 'package:aidber/screens/create_new_event/create_new_event_view.dart';
import 'package:aidber/screens/edit_profile/edit_profile_view.dart';
import 'package:aidber/screens/event_detail_screen/event_detail_view.dart';
import 'package:aidber/screens/events/events_view.dart';
import 'package:aidber/screens/home_screen/home_screen_view.dart';
import 'package:aidber/screens/login/login_view.dart';
import 'package:aidber/screens/menu/menu_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'global_widgets/report_dialog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      defaultTransition: Transition.cupertino,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        primaryColor: const Color(0xFF282d6b),

      ),
      home:  HomeScreenView(),
    );
  }
}




