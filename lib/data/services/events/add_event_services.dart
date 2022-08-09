import 'dart:convert';

import 'package:aidber/controllers/storage_controller/storage_controller.dart';
import 'package:aidber/models/event/event_model.dart';
import 'package:aidber/utils/api_urls.dart';
import 'package:aidber/utils/utils.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../api.dart';

class EventServices {
  static ApiClient client = Get.find<ApiClient>();

  ///Get All Event..........
  static Future getAllEvents() async {
    Map<String, String> headersV2 = {'x-api-key': Get.find<storage_controller>().box.read("token")};
    var response = await client.getData(ApiUrls.GET_ALL_EVENTS, headers: headersV2);
    try {
      if (response.statusCode == 200 && response.body["data"] != null) {
        return AllEventsModel.fromJson(response.body);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      print("error from api_urls.getAllEvents");
    }
  }

  static Future getCommingThisWeekEvents() async {
    Map<String, String> headersV2 = {'x-api-key': Get.find<storage_controller>().box.read("token")};
    var response = await client.getData(ApiUrls.COMMING_THIS_WEEKEVENTS, headers: headersV2);
    try {
      if (response.statusCode == 200 && response.body["data"] != null) {
        return AllEventsModel.fromJson(response.body);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      print("error from api_urls.getAllEvents");
    }
  }

  static Future getAllEventsById({required String id}) async {
    Map<String, String> headersV2 = {'x-api-key': Get.find<storage_controller>().box.read("token")};
    var response = await client.getData(ApiUrls.GET_ALL_EVENTS + "/$id", headers: headersV2);
    try {
      if (response.statusCode == 200 && response.body["data"] != null) {
        return AllEventsModel.fromJson(response.body);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      print("error from api_urls.getAllEvents");
    }
  }

  static Future searchEventByKeyword({required String keyword}) async {
    var headers = {'x-api-key': Get.find<storage_controller>().userModel.result!.token.toString()};
    var response = await client.postData(ApiUrls.SEARCH_EVENT, {"keyword": keyword}, headers: headers);
    try {
      if (response.statusCode == 200 && response.body["data"] != null) {
        return AllEventsModel.fromJson(response.body);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      print("error from api_urls.getAllEvents");
    }
  }

  static Future add_event(
      {required String title,
      required String location,
      required String organised_by,
      required String what_to_expect,
      required String latitude,
      required String longitude,
      required String description,
      required String imagePath,
      required String date,
      required String time}) async {
    Map<String, String> body = {
      'title': title,
      'location': location,
      "organised_by": organised_by,
      'lat': latitude.isEmpty ? "000" : latitude,
      'lng': longitude.isEmpty ? "000" : longitude,
      'description': description,
      'date': date,
      'time': time,
      'what_to_expect': what_to_expect,
    };
    var headers = {'x-api-key': Get.find<storage_controller>().userModel.result!.token.toString(), 'Content-Type': 'application/json'};

    http.MultipartRequest request = http.MultipartRequest(
      'POST',
      Uri.parse(ApiUrls.ADD_EVENT),
    );

    try {
      http.MultipartFile file = await http.MultipartFile.fromPath("image", imagePath);
      request.files.add(file);
    } catch (e) {
      print("EXCEPTION FROM ADDING FILE $e");
    }

    request.fields.addAll(body);
    request.headers.addAll(headers);
    print("Hitting====> $ApiUrls.ADD_EVENT ");
    print("SENDING BODY ===> $body");

    http.StreamedResponse response = await request.send();
    var responseBody = await response.stream.bytesToString();
    if (responseBody.isNotEmpty) {
      print(responseBody);
      Map<String, dynamic> body = jsonDecode(responseBody);
      if (body["status"] == true) {
        return Event.fromJson(body["data"]);
      } else {
        return body;
      }
    } else {
      show_snackBarError(title: "Internet Connection", description: "Please chceck your internet conenction");
      return null;
    }
  }
}