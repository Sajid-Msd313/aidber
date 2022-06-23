

import 'package:aidber/controllers/auth/signin_controller.dart';
import 'package:aidber/controllers/auth/signup_controller.dart';
import 'package:aidber/controllers/root_page_controller.dart';
import 'package:aidber/controllers/storage_controller/storage_controller.dart';
import 'package:aidber/screens/home_screen/controller/all_post_controller.dart';
import 'package:aidber/screens/home_screen/controller/home_controller.dart';
import 'package:aidber/utils/api_urls.dart';
import 'package:get/get.dart';

import '../data/api.dart';
import '../screens/comment_screen/controllers/comment_controller.dart';
import '../screens/create_a_post/controller/create_post_controller.dart';

Future<void> init()async{
  await Get.put(storage_controller(), permanent: true).initStorage();
  Get.lazyPut(() => ApiClient(appBaseUrl: api_urls.BASE_URL, storageController: Get.find<storage_controller>()));
  Get.lazyPut(() => root_page_controller());
  Get.lazyPut(() => signin_controller(apiClient: Get.find<ApiClient>()));
  Get.lazyPut(() => signup_controller(apiClient: Get.find<ApiClient>()));
  Get.lazyPut(() => all_post_controller(apiClient: Get.find<ApiClient>()));
  Get.lazyPut(() => create_post_controller(apiClient: Get.find<ApiClient>()),fenix: true);
  // Get.lazyPut(() => comment_controller(apiClient: Get.find<ApiClient>()));

}