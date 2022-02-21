
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
     // showPerformanceOverlay: true,
   //   debugShowMaterialGrid: true,
//showSemanticsDebugger: true,
//debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      defaultTransition: Transition.cupertino,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        primaryColor: const Color(0xFF282d6b),

      ),
      home:  bottom_nav_bar_custom(),
    );
  }
}




