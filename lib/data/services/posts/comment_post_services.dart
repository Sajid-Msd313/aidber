import 'package:aidber/controllers/storage_controller/storage_controller.dart';
import 'package:aidber/data/api.dart';
import 'package:aidber/utils/api_urls.dart';
import 'package:get/get.dart';

import '../../../models/posts/like_post_model.dart';

class comment_post_services {
  static Future comment(
      {required ApiClient client,
        required String post_id,
        required String comment}) async {
    Map<String, String> body = {
      'comment': comment,
      'post_id': post_id,
    };
    print("POST body ====> \n" + body.toString());
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
}
