import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../controllers/storage_controller/storage_controller.dart';
import '../../../models/network/follower_requests_model.dart';
import '../../../utils/api_urls.dart';
import '../../api.dart';

class NetworkServices {
  static ApiClient client = Get.find<ApiClient>();

  static Future<FollowerRequestModel?> getAllFollowerRequest(String? nextPageUrl) async {
    Map<String, String> headersV2 = {'x-api-key': Get.find<storage_controller>().box.read("token")};
    var response = await client.getData(nextPageUrl ?? ApiUrls.GET_FOLLOWER_REQUEST, headers: headersV2);
    try {
      if (response.statusCode == 200) {
        return FollowerRequestModel.fromJson(response.body);
      }
    } catch (e) {
      debugPrint(e.toString());
      debugPrint("error from /get-innovations");
    }
  }

  static Future acceptFriendRequest({required String follow_id}) async {
    var headers = {'x-api-key': Get.find<storage_controller>().userModel.result!.token.toString()};
    var response = await client.postData(ApiUrls.UPDATE_BUSINESS_FOLLOW_STATUS, {"follow_id": follow_id, "action": "Approved"}, headers: headers);
    try {
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      print("error from api_urls.getAllEvents");
    }
  }
}