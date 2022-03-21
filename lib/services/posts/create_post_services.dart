import 'dart:convert';

import 'package:aidber/controllers/storage_controller/storage_controller.dart';
import 'package:aidber/utils/api_urls.dart';
import 'package:aidber/utils/utils.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class create_post_services {
  static http.Client client = http.Client();
  static String url_debug = api_urls.CREATE_POST;

  static Future create_post(
      {required String caption,
      required String latitude,
      required String longitude,
      required String image_file,
      required String post_category}) async {
    Map<String, String> body = {
      'caption': caption,
      'latitude': latitude.isEmpty? "000"  : latitude,
      'longitude': longitude.isEmpty?"000" : longitude,
      'type':post_category,
    };
    var headers = {
      'x-api-key': '${Get.find<storage_controller>().userModel.result!.token.toString()}',
      'Content-Type': 'application/json'
    };
    http.MultipartRequest request = http.MultipartRequest(
      'POST',
      Uri.parse(api_urls.CREATE_POST),
    );
    http.MultipartFile file =
        await http.MultipartFile.fromPath("post_url", image_file);
    request.files.add(file);
    request.fields.addAll(body);
    request.headers.addAll(headers);
    print("Hitting====>${api_urls.CREATE_POST} ");
    print("SENDING BODY ===> $body");


    http.StreamedResponse response = await request.send();
    var responseBody = await response.stream.bytesToString();
    if (responseBody.isNotEmpty) {
      print(responseBody);
      return jsonDecode(responseBody);
    } else {
      show_snackBarError(title: "Internet Connection", description: "Please chceck your internet conenction");
     return null;
    }
  }
}
