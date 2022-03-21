

import 'package:aidber/controllers/auth/signin_controller.dart';
import 'package:aidber/controllers/auth/signup_controller.dart';
import 'package:aidber/controllers/root_page_controller.dart';
import 'package:aidber/controllers/storage_controller/storage_controller.dart';
import 'package:aidber/screens/home_screen/controller/all_post_controller.dart';
import 'package:aidber/screens/home_screen/controller/home_controller.dart';
import 'package:get/get.dart';

import '../screens/create_a_post/controller/create_post_controller.dart';

Future<void> init()async{
  await Get.put(storage_controller(), permanent: true).initStorage();
  Get.lazyPut(() => root_page_controller());
  Get.lazyPut(() => signin_controller());
  Get.lazyPut(() => signup_controller());
  Get.lazyPut(() => all_post_controller());
  Get.lazyPut(() => create_post_controller(),fenix: true);

}