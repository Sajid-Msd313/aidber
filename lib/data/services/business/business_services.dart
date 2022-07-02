import 'package:aidber/utils/api_urls.dart';
import 'package:get/get.dart';

import '../../../models/business/user_business_model.dart';
import '../../api.dart';

class business_services {
  static ApiClient client = Get.find<ApiClient>();
  static Map<String, String> headers = {
    'x-api-key': client.token.toString(),
    'Content-Type': 'application/json'
  };
  static Map<String, String> headersV2 = {'x-api-key': client.token.toString()};

  static Future createAccountBusiness({required Map reqBody}) async {
    print(" UserBusinessModel POST Comment body ====> \n" + reqBody.toString());
    var response = await client.postData(api_urls.CREATE_BUSINESS, reqBody,
        headers: headersV2);

    try {
      if (response.statusCode == 200 && response.body.isNotEmpty) {
        print(response.body.toString() + " <<<<<< UserBusinessModel");
        return UserBusinessModel.fromJson(response.body);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      print("error from api_urls.COMMENT");
      print(reqBody);
    }
  }
}
