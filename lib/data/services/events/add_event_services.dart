import 'dart:convert';

import 'package:aidber/controllers/storage_controller/storage_controller.dart';
import 'package:aidber/utils/api_urls.dart';
import 'package:aidber/utils/utils.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class add_event_services {
  static http.Client client = http.Client();
  static String url_debug = api_urls.ADD_EVENT;

  static Future add_event({required String title, required String location, required String latitude, required String longitude, required String description, required String image_file, required String date}) async {

     Map<String,String> body = {
       'title': title,
       'location': location,
       'latitude': latitude.isEmpty? "000"  : latitude,
       'longitude': longitude.isEmpty?"000" : longitude,
       'description': description,
       'date': date
     };
    var headers = {
      'x-api-key': Get.find<storage_controller>().userModel.result!.token.toString(),
      'Content-Type': 'application/json'
    };


    http.MultipartRequest request = http.MultipartRequest(
      'POST', Uri.parse(api_urls.ADD_EVENT),
    );

    try{
      http.MultipartFile file = await http.MultipartFile.fromPath("image", image_file);
      request.files.add(file);
    }catch(e){
      print("EXCEPTION FROM ADDING FILE $e");
    }

    request.fields.addAll(body);
    request.headers.addAll(headers);
    print("Hitting====> $url_debug ");
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
