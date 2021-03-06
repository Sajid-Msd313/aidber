import 'package:aidber/menu/navigation_bar/bottom_nav_bar_custom.dart';
import 'package:aidber/screens/auth/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/storage_controller/storage_controller.dart';
import 'utils/get_di.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Found Heal',
      defaultTransition: Transition.fadeIn,
      theme: ThemeData(

        fontFamily: 'Montserrat',
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.indigo,
        accentColor: Colors.blueAccent,
        primaryColor: const Color(0xFF282d6b),
      ),
      // home:  Sign_In2(),
      home: Get.find<storage_controller>().restoreLoginModel() == null ? const Sign_In2() : const root_page(),
    );
  }
}