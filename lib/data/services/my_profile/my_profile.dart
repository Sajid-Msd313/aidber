
import 'package:aidber/controllers/storage_controller/storage_controller.dart';
import 'package:aidber/utils/api_urls.dart';
import 'package:aidber/utils/constants.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../models/my_profile/my_profile_model.dart';
import '../../../utils/utils.dart';
import '../../api.dart';

class myProfile_services {

  static ApiClient client = Get.find<ApiClient>();
  static Map<String, String> headers = {
    'x-api-key':Get.find<storage_controller>().box.read("token").toString(),
    'Content-Type': 'application/json'
  };
  static Map<String, String> headersV2 = {
    'x-api-key': Get.find<storage_controller>().box.read("token").toString(),
  };


  static Future fetch_myProfile_services() async {
    String url = ApiUrls.USER_PROFILE;
    print("**hitting $url");
    try {
      Response response = await client.getData(url, headers: headers);
      if (response.statusCode == 200) {
        return MyProfileModel.fromJson(response.body);
      } else{
        print("aaaaaaaaaaaaaaa");
        return response;
      }

    } on PlatformException catch (e) {
      print("Null from $url");
      print(e);
      show_snackBarError(title: "Error", description: e.message.toString());
    } catch (e) {
      print("error from $url");
      show_snackBarError(
          title: "Error", description: constans.NO_INTERNET_CONNECTION);
      print("error from $url $e");
    }
  }

  static Future editMyProfile({required Map reqBody}) async {
    String url = ApiUrls.UPDATE_PROFILE;
    print("**hitting $url");
    try {
      Response response = await client.postData(url,reqBody, headers: headersV2);
      if (response.statusCode == 200) {
        return MyProfileModel.fromJson(response.body);
      } else{
        print("aaaaaaaaaaaaaaa");
        return response;
      }

    } on PlatformException catch (e) {
      print("Null from $url");
      print(e);
      show_snackBarError(title: "Error", description: e.message.toString());
    } catch (e) {
      print("error from $url");
      show_snackBarError(
          title: "Error", description: constans.NO_INTERNET_CONNECTION);
      print("error from $url $e");
    }
  }

}