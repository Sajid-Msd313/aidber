import 'package:aidber/models/innovations/innovation_item_model.dart';
import 'package:aidber/screens/innovations/controller/InnovationMainController.dart';
import 'package:aidber/utils/api_urls.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';

import '../../../controllers/storage_controller/storage_controller.dart';
import '../../../models/innovations/innovation_response_model.dart';
import '../../../utils/utils.dart';
import '../../api.dart';

typedef OnUploadProgressCallback = void Function(int sentBytes, int totalBytes);

class CreateInnovationServices {
  static String url_debug = ApiUrls.CREATE_INNOVATION;
  static ApiClient client = Get.find<ApiClient>();
  static Future<InnovationResponseModel?> getInnovations(String? nextPageUrl) async {
    Map<String, String> headersV2 = {'x-api-key': Get.find<storage_controller>().box.read("token")};
    var response = await client.getData(nextPageUrl??ApiUrls.GET_INNOVATIONS, headers: headersV2);
    try {
      if (response.statusCode == 200 && response.body["data"] != null) {
        return InnovationResponseModel.fromJson(response.body);
      }
    } catch (e) {
      print(e);
      print("error from /get-innovations");
    }
  }
  static Future shareInnovation({required String id}) async {
    Map<String, String> headersV2 = {'x-api-key': Get.find<storage_controller>().box.read("token")};
    var response = await client.getData(ApiUrls.SHARE_INNOVATION + "/$id", headers: headersV2);
    try {
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      print(e);
      print("error from /get-innovations");
    }
  }

  static Future createInnovationPost(
      {required OnUploadProgressCallback callback,
      required Map<String, dynamic> reqBody,
      List<String?>? imagesPath,
      String? filepath}) async {
    dio.Response response;
    var client = dio.Dio();

    //  print(response.data.toString());

    var formData = dio.FormData.fromMap({
      "title": reqBody["title"],
      "category": reqBody["category"],
      "link": reqBody["link"],
      "description": reqBody["description"],
      'image[]': imagesPath?.map((e) async => e != null
          ? await dio.MultipartFile.fromFile(e,
              contentType: MediaType("image", "jpeg"), //important
              filename: imagesPath.indexOf(e).toString())
          : null),
      'file[]': filepath != null ? await dio.MultipartFile.fromFile(filepath) : null
    });

    print("this is fields.... ${formData.fields.toString()}");
    try{
      response = await client.post(
        ApiUrls.CREATE_INNOVATION,
        data: formData,
        options: dio.Options(
          method: 'POST',
          headers: {
            'x-api-key': Get.find<storage_controller>().userModel.result!.token.toString(),
          },
        ),
        onSendProgress: callback,
      );
      if (response.data != null) {
        print(response.data);
        return response.data;
        //return jsonDecode(responseBody);
      } else {
        show_snackBarError(title: "Internet Connection", description: "Please chceck your internet conenction");
        return null;
      }
    }on dio.DioError catch (e){
      print(e.response?.data);
      return e.response?.data;
    }

  }


}