import 'dart:convert';

import 'package:aidber/models/auth/login_model.dart';
import 'package:aidber/models/auth/signup_model.dart';
import 'package:http/http.dart' as http;
import 'package:aidber/utils/api_urls.dart';
class signin_services {
  static var client = http.Client();

  static Future post_signin_api({required String email, required String password}) async
  {
    Map<String, String> body = {
      'email': email,
      'password': password,
      'device_token' : "asd"
    };
    print("POST body ====> \n" +body.toString());
    var response = await client.post(Uri.parse(api_urls.SIGN_IN,),body: body);
    print("=======> RESPONSE BODY FOR SIGN_IN");
    print(response.body);
    try {
      if (response.statusCode == 200 && response.body.isNotEmpty) {
        final requestbody = json.decode(response.body);
        return loginModelFromJson(response.body);
      } else {
        return null;
      }
    } catch (e) {
      print("error from https://www.paakhealth.com/dochealth/api/SIGN_IN");
      print(body);
    }
  }
}
