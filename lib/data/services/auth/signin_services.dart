import 'package:aidber/data/api.dart';
import 'package:aidber/models/auth/login_model.dart';
import 'package:aidber/utils/api_urls.dart';
import 'package:get/get.dart';

class signin_services {
  static Future post_signin_api(
      {required ApiClient client,
      required String email,
      required String password}) async {
    Map<String, String> body = {
      'email': email,
      'password': password,
      'device_token': "asd"
    };

    print("POST body ====> \n" + body.toString());
    try {
      Response response = await client.postData(api_urls.SIGN_IN, body);
      print("=======> RESPONSE BODY FOR SIGN_IN");
      print(response.body);

      if (response.statusCode == 200 && response.body.isNotEmpty) {
        return LoginModel.fromJson(response.body);
      } else {
        return response;
      }
    } catch (e) {
      print(e);
      print("error from https://www.paakhealth.com/dochealth/api/SIGN_IN");
      print(body);
    }
  }
}
