import 'package:aidber/models/fund_raiser/fund_raiser_model.dart';
import 'package:aidber/utils/api_urls.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../controllers/storage_controller/storage_controller.dart';
import '../../api.dart';
import 'fund_raiser_detail.dart';

class FundRaiserServices {
  static ApiClient client = Get.find<ApiClient>();


  static Future<FundRaiserModel?> getAllFundRaiser() async {
    Map<String, String> headersV2 = {'x-api-key': Get.find<storage_controller>().box.read("token")};
    var response = await client.getData(ApiUrls.GET_FUND_RAISERS, headers: headersV2);
    try {
      if (response.statusCode == 200 && response.body["data"] != null) {
        return FundRaiserModel.fromJson(response.body);
      }
    } catch (e) {
      print(e);
      print("error from api_urls.getAllEvents");
    }
  }
  static Future<FundRaiserDetailModel?> getAFundRaiserDetails(String id) async {
    Map<String, String> headersV2 = {'x-api-key': Get.find<storage_controller>().box.read("token")};
    var response = await client.getData(ApiUrls.GET_FUND_RAISER_DETAIL +"/$id", headers: headersV2);
    try {
      if (response.statusCode == 200 && response.body["data"] != null) {
        return FundRaiserDetailModel.fromJson(response.body);
      }
    } catch (e) {
      print(e);
      print("error from api_urls.getAllEvents");
    }
  }
}