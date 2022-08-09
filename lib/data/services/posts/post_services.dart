import 'dart:convert';

import 'package:aidber/controllers/storage_controller/storage_controller.dart';
import 'package:aidber/data/api.dart';
import 'package:aidber/models/posts/all_posts_model.dart';
import 'package:aidber/models/posts/get_single_comment_model.dart';
import 'package:aidber/utils/api_urls.dart';
import 'package:aidber/utils/constants.dart';
import 'package:aidber/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../models/local/SuccessOrErrorMessageModel.dart';
import '../../../models/posts/comment_post_model.dart';
import '../../../models/posts/like_post_model.dart';

class post_services {
  // headers: {
  // 'x-api-key': '${Get.find<storage_controller>().box.read("token")}'
  // }
  static ApiClient client = Get.find<ApiClient>();

  static Future fetch_all_post_services({required ApiClient client, String? loadMoreUrl}) async {
    Map<String, String> headers = {'x-api-key': Get.find<storage_controller>().box.read("token"), 'Content-Type': 'application/json'};
    Map<String, String> headersV2 = {'x-api-key': Get.find<storage_controller>().box.read("token")};
    String url = ApiUrls.GET_ALL_POST;
    if(loadMoreUrl != null){
      url = loadMoreUrl;
    }
    print("**hitting $url");
    try {
      Response response = await client.postData(url, "", headers: headers);
      if (response.statusCode == 200) {
        return GetAllPost.fromJson(response.body);
      } else {
        return response;
      }
    } on PlatformException catch (e) {
      print("Null from $url");
      print(e);
      show_snackBarError(title: "Error", description: e.message.toString());
    } catch (e) {
      print("error from $url");
      show_snackBarError(title: "Error", description: constans.NO_INTERNET_CONNECTION);
      print("error from $url $e");
    }
  }

  static Future postComment({required String post_id, required String comment, required String reply_to}) async {
    Map<String, String> headers = {'x-api-key': Get.find<storage_controller>().box.read("token"), 'Content-Type': 'application/json'};
    Map<String, String> headersV2 = {'x-api-key': Get.find<storage_controller>().box.read("token")};
    Map<String, String> body = {
      'comment': comment,
      'post_id': post_id,
      "reply_to": reply_to,
    };
    print("POST Comment body ====> \n" + body.toString());
    var response = await client.postData(ApiUrls.COMMENT, body, headers: headersV2);

    try {
      if (response.statusCode == 200 && response.body.isNotEmpty) {
        print(response.body.toString() + " <<<<<<");
        return CommentPostModel.fromJson(response.body);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      print("error from api_urls.COMMENT");
      print(body);
    }
  }

  static Future like_post({required ApiClient client, required String post_id, required String type}) async {
    Map<String, String> headers = {'x-api-key': Get.find<storage_controller>().box.read("token"), 'Content-Type': 'application/json'};
    Map<String, String> headersV2 = {'x-api-key': Get.find<storage_controller>().box.read("token")};
    Map<String, String> body = {
      'type': type,
      'post_id': post_id,
    };
    print("POST body ====> \n" + body.toString());
    var response = await client.postData(ApiUrls.LIKE_POST, body, headers: headersV2);
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

  static Future getCommentsByPostId({required String post_id}) async {
    String url = ApiUrls.GET_POST_COMMENT + "/$post_id";

    try {
      Response response = await client.getData(url, headers: {'x-api-key': '${Get.find<storage_controller>().box.read("token")}'});
      if (response.statusCode == 200) {
        var encodedResponse = jsonEncode(response.body);
        return singleCommentFromJson(encodedResponse);
      } else {
        return response;
      }
    } on PlatformException catch (e) {
      debugPrint(e.message.toString());
      show_snackBarError(title: "Error", description: e.message.toString());
    } catch (e) {
      print(e);
      debugPrint("error from $url");
      show_snackBarError(title: "Error", description: constans.NO_INTERNET_CONNECTION);
    }
  }

  static Future<SuccessOrMessageModel?> requestToFollow({required String user_id, required bool isFollow}) async {
    Map<String, String> headersV2 = {'x-api-key': Get.find<storage_controller>().box.read("token")};
    var response = await client.postData(ApiUrls.REQUEST_TO_FOLLOW, {"user_id": user_id, "action": isFollow ? "follow" : "unfollow"},
        headers: headersV2);
    SuccessOrMessageModel resModel = SuccessOrMessageModel();
    try {
      if (response.statusCode == 200 && response.body.isNotEmpty) {
        resModel.isError = !response.body["status"] as bool;
        resModel.message = response.body["message"];
      }
      return resModel;
    } catch (e) {
      print("error from api_urls.requestToFollow + $e");
      resModel;
    }
  }

  static Future<SuccessOrMessageModel> savePost({required String post_id}) async {
    Map<String, String> headers = {'x-api-key': Get.find<storage_controller>().box.read("token"), 'Content-Type': 'application/json'};
    Map<String, String> headersV2 = {'x-api-key': Get.find<storage_controller>().box.read("token")};
    var response = await client.getData(ApiUrls.SAVE_POST + "/$post_id", headers: headers);
    SuccessOrMessageModel resModel = SuccessOrMessageModel();
    try {
      if (response.statusCode == 200 && response.body.isNotEmpty) {
        resModel.isError = response.body["status"];
        resModel.message = response.body["message"];
      }
      return resModel;
    } catch (e) {
      print("error from api_urls.requestToFollow + $e");
      return resModel;
    }
  }

  static Future<SuccessOrMessageModel> blockUser({required String user_id}) async {
    Map<String, String> headers = {'x-api-key': Get.find<storage_controller>().box.read("token"), 'Content-Type': 'application/json'};
    var response = await client.getData(ApiUrls.BLOCK_USER + "/$user_id", headers: headers);
    SuccessOrMessageModel resModel = SuccessOrMessageModel();
    try {
      if (response.statusCode == 200 && response.body.isNotEmpty) {
        resModel.isError = !response.body["status"];
        resModel.message = response.body["message"];
      }
      return resModel;
    } catch (e) {
      print("error from api_urls.requestToFollow + $e");
      return resModel;
    }
  }

  static Future<bool> sharePost({required String post_id}) async {
    Map<String, String> headers = {'x-api-key': Get.find<storage_controller>().box.read("token"), 'Content-Type': 'application/json'};
    Map<String, String> headersV2 = {'x-api-key': Get.find<storage_controller>().box.read("token")};
    var response = await client.getData(ApiUrls.SAVE_POST + "/$post_id", headers: headers);

    try {
      if (response.statusCode == 200 && response.body.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("error from api_urls.requestToFollow + $e");
      return false;
    }
  }
}