import 'dart:ffi';

import 'package:aidber/controllers/storage_controller/storage_controller.dart';
import 'package:aidber/data/api.dart';
import 'package:aidber/models/posts/all_posts_model.dart';
import 'package:aidber/utils/api_urls.dart';
import 'package:aidber/utils/constants.dart';
import 'package:aidber/utils/utils.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../models/posts/like_post_model.dart';

class post_services {
  static Future requestToFollow(
      {required ApiClient client,
        required String post_id,}) async {
    var response = await client.postData(api_urls.REQUEST_TO_FOLLOW+"/$post_id", null,  headers: {
      'x-api-key': '${Get.find<storage_controller>().box.read("token")}'
    });


    try {
      if (response.statusCode == 200 && response.body.isNotEmpty) {
        return LikePostModel.fromJson(response.body);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      print("error from api_urls.requestToFollow");
    }
  }


  static Future fetch_all_post_services(
      {required ApiClient client}) async {
     String url = api_urls.GET_ALL_POST;
    print("**hitting $url");
    Map<String, String> headers = {
      'x-api-key': client.token.toString(),
      'Content-Type': 'application/json'
    };
    try {
      Response response = await client.postData(url, "", headers: headers);
      if (response.statusCode == 200) {
        return GetAllPost.fromJson(response.body);
      } else {
        return response;
      }
      /* if (kDebugMode) {
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
      }*/
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

  static Future comment(
      {required ApiClient client,
      required String post_id,
      required String comment,
        required String reply_to}) async {
    Map<String, String> body = {
      'comment': comment,
      'post_id': post_id,
      "reply_to": reply_to,
    };
    print("POST Comment body ====> \n" + body.toString());
    var response = await client.postData(api_urls.COMMENT, body, headers: {
      'x-api-key': '${Get.find<storage_controller>().box.read("token")}'
    });

    try {
      if (response.statusCode == 200 && response.body.isNotEmpty) {
        return LikePostModel.fromJson(response.body);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      print("error from api_urls.COMMENT");
      print(body);
    }
  }



  static Future   like_post(
      {required ApiClient client,
      required String post_id,
      required String type}) async {
    Map<String, String> body = {
      'type': type,
      'post_id': post_id,
    };
    print("POST body ====> \n" + body.toString());
    var response = await client.postData(api_urls.LIKE_POST, body, headers: {
      'x-api-key': '${Get.find<storage_controller>().box.read("token")}'
    });
    print("=======> RESPONSE BODY FOR likePost");

    try {
      if (response.statusCode == 200 && response.body.isNotEmpty) {
        return LikePostModel.fromJson(response.body);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      print("error from api_urls.LIKE_POST");
      print(body);
    }
  }

}

