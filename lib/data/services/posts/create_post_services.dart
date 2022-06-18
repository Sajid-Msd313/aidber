import 'dart:async';

import 'package:aidber/screens/create_a_post/widgets/tag_people_search.dart';
import 'package:aidber/utils/api_urls.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import '../../../controllers/storage_controller/storage_controller.dart';
import '../../../utils/utils.dart';
// import 'package:http/http.dart' as http;
typedef void OnUploadProgressCallback(int sentBytes, int totalBytes);
class create_post_services {
  // static http.Client client = http.Client();
  static String url_debug = api_urls.CREATE_POST;

  static Future create_post(

      {
        required OnUploadProgressCallback callback,
        required String caption,
      required String latitude,
      required String longitude,
      required List<String> image_file,
        required List<UserModel?> taggedUsers,
      required String post_category}) async {
    dio.Response response;
    var client = dio.Dio();

    //  print(response.data.toString());

    var formData = dio.FormData.fromMap({
      'caption': caption,
      'latitude': latitude.isEmpty ? "000" : latitude,
      'longitude': longitude.isEmpty ? "000" : longitude,
      'type': post_category,
      // 'file': await dio.MultipartFile.fromFile('./text.txt', filename: 'upload.txt'),
      'files': image_file.map((e) async => await dio.MultipartFile.fromFile(e,
          contentType:  MediaType("image", "jpeg"), //important
          filename: image_file.indexOf(e).toString()))
    }); //'x-api-key': '${Get.find<storage_controller>().userModel.result!.token.toString()}',
    taggedUsers.forEach((element) {
      formData.fields.add(MapEntry("tagged[]", element!.id.toString()));
    });

    print("this is fields.... ${formData.fields.toString()}");
    response = await client.post(
      api_urls.CREATE_POST,data: formData,
        options: dio.Options(
          method: 'POST',
          headers: {

            'x-api-key' :Get.find<storage_controller>().userModel.result!.token.toString(),
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
/*
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

    for(String imgpath in image_file){
      http.MultipartFile file = await http.MultipartFile.fromPath("image[]", imgpath);
      request.files.add(file);
    }


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
    }*/
  }

/*
  static Future create_post(
      {required String caption,
      required String latitude,
      required String longitude,
      required List<String> image_file,
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

    for(String imgpath in image_file){
      http.MultipartFile file = await http.MultipartFile.fromPath("image[]", imgpath);
      request.files.add(file);
    }


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
  }*/
}
