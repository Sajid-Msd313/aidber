import 'package:aidber/utils/api_urls.dart';
import 'package:get/get.dart';

import '../../../controllers/storage_controller/storage_controller.dart';
import '../../../models/business/user_business_model.dart';
import '../../api.dart';

class business_services {
  static ApiClient client = Get.find<ApiClient>();


  static Future createAccountBusiness({required Map reqBody}) async {
     Map<String, String> headers = {
      'x-api-key': Get.find<storage_controller>().box.read("token"),
      'Content-Type': 'application/json'
    };
     Map<String, String> headersV2 = {'x-api-key': Get.find<storage_controller>().box.read("token")};
    print(" createAccountBusiness body ====> \n" + reqBody.toString());
    var response = await client.postData(ApiUrls.CREATE_BUSINESS, reqBody,
        headers: headersV2);

    try {
      if (response.statusCode == 200 && response.body["data"] != null) {
        print(response.body.toString() + " <<<<<< createAccountBusiness");
        return BusinessItem.fromJson(response.body["data"]);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      print("error from api_urls.createAccountBusiness");
      print(reqBody);
    }
  }


  static Future fetchUserBusinessAccounts() async {
    Map<String, String> headers = {
      'x-api-key': Get.find<storage_controller>().box.read("token"),
      'Content-Type': 'application/json'
    };
    Map<String, String> headersV2 = {'x-api-key': Get.find<storage_controller>().box.read("token")};
    var response = await client.getData(ApiUrls.GET_BUSINESSES,
        headers: headersV2);
    try {
      if (response.statusCode == 200 && response.body["data"] != null) {
        print(response.body.toString() + " <<<<<< fetchUserBusinessAccounts");
        return UserBusinessModel.fromJson(response.body);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      print("error from api_urls.fetchUserBusinessAccounts");

    }
  }
}