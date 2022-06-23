import 'dart:convert';

import 'package:aidber/controllers/storage_controller/storage_controller.dart';
import 'package:aidber/data/api.dart';
import 'package:aidber/models/posts/all_posts_model.dart';
import 'package:aidber/utils/api_urls.dart';
import 'package:aidber/utils/constants.dart';
import 'package:aidber/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class all_post_services {
  static var client = http.Client();
  static String url = api_urls.GET_ALL_POST;

  static Future fetch_all_post_services({required ApiClient client}) async {
    print("**hitting $url");
    Map<String,String> headers = {
      'x-api-key': client.token.toString(),
      'Content-Type': 'application/json'
    };
    try {
      Response response = await client.postData(url,"",headers: headers);
      if(response.statusCode == 200){
        return GetAllPost.fromJson(response.body);
      }else{
        return response;
      }
    if (kDebugMode) {
      print(response.body);
    }

    final requestbody = json.decode(response.body);

      if (requestbody.isNotEmpty || requestbody != null) {
        print("API response good api_urls....$url");
        return getAllPostFromJson(response.body);
      } else {
        show_snackBarError(
            title: "Error", description: constans.NO_INTERNET_CONNECTION);
        print("Null from $url");
        return null;
      }
    } on PlatformException catch (e) {
      print("Null from $url");
      print(e);
      show_snackBarError(title: "Error", description: e.message.toString());
    } catch (e) {
      print("error from $url");
      show_snackBarError(
          title: "Error", description: constans.NO_INTERNET_CONNECTION);
      print("error from $url $e");
    }
  }
}
