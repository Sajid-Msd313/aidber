import 'package:aidber/utils/api_urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../controllers/storage_controller/storage_controller.dart';
import '../../../models/business/user_business_model.dart';
import '../../api.dart';

class business_services {
  static ApiClient client = Get.find<ApiClient>();

  static Future createAccountBusiness({required Map reqBody}) async {
    Map<String, String> headersV2 = {'x-api-key': Get.find<storage_controller>().box.read("token")};
    debugPrint(" createAccountBusiness body ====> \n" + reqBody.toString());
    var response = await client.postData(ApiUrls.CREATE_BUSINESS, reqBody, headers: headersV2);

    try {
      if (response.statusCode == 200 && response.body["data"] != null) {
        debugPrint(response.body.toString() + " <<<<<< createAccountBusiness");
        return BusinessItem.fromJson(response.body["data"]);
      } else {
        return response.body;
      }
    } catch (e) {
      debugPrint(e.toString());
      debugPrint("error from api_urls.createAccountBusiness");
      debugPrint(reqBody.toString());
    }
  }  
  
  static Future updateAccountBusiness({required Map reqBody, required String id}) async {
    Map<String, String> headersV2 = {'x-api-key': Get.find<storage_controller>().box.read("token")};
    debugPrint(" UpadtingAccountBusiness body ====> \n" + reqBody.toString());
    var response = await client.postData(ApiUrls.UPDATE_BUISNESS + "/$id", reqBody, headers: headersV2);

    try {
      if (response.statusCode == 200 && response.body["data"] != null) {

        debugPrint(response.body.toString() + " <<<<<< UpadtingAccountBusiness");
        return response.body;
      } else {
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
      debugPrint("error from api_urls.createAccountBusiness");
      debugPrint(reqBody.toString());
    }
  }

  static Future fetchUserBusinessAccounts() async {
    Map<String, String> headersV2 = {'x-api-key': Get.find<storage_controller>().box.read("token")};
    var response = await client.getData(ApiUrls.GET_BUSINESSES, headers: headersV2);
    try {
      if (response.statusCode == 200 && response.body["data"] != null) {
        debugPrint(response.body.toString() + " <<<<<< fetchUserBusinessAccounts");
        return UserBusinessModel.fromJson(response.body);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
      debugPrint("error from api_urls.fetchUserBusinessAccounts");
    }
  }

  static Future deleteUserBusinessAccount({required String id}) async {
    Map<String, String> headersV2 = {'x-api-key': Get.find<storage_controller>().box.read("token")};
    var response = await client.getData(ApiUrls.DELETE_BUSINESS + "/$id", headers: headersV2);
    try {
      if (response.statusCode == 200) {
        debugPrint(response.body.toString() + " <<<<<< deleteUserBusinessAccount");
        return response.body;
      } else {
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
      debugPrint("error from api_urls.deleteUserBusinessAccount");
    }
  }
}