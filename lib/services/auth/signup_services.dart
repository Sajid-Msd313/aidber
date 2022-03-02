import 'dart:convert';

import 'package:aidber/models/auth/signup_model.dart';
import 'package:http/http.dart' as http;
import 'package:aidber/api_urls.dart';
class signup_services {
  static var client = http.Client();

  static Future post_signup_api(
      {required String username,
      required String full_name,
      required String email,
      required String password}) async {
    Map<String, String> body = {
      'username': username,
      'full_name': full_name,
      'email': email,
      'password': password
    };
    print("POST body ====> \n" +body.toString());
    var response = await client
        .post(Uri.parse(api_urls.BASE_URL + api_urls.SIGN_UP,),body: body);
    print("=======> RESPONSE BODY FOR SIGNUP");
    print(response.body);
    try {
      if (response.statusCode == 200 && response.body.isNotEmpty) {
        final requestbody = json.decode(response.body);

        if (requestbody["status"].toString() == "1") {
          return signupModelFromJson(response.body);
        } else {
          return requestbody;
        }
      } else {
        return null;
      }
    } catch (e) {
      print("error from https://www.paakhealth.com/dochealth/api/signup");
      print(body);
    }
  }
// static post_signup_api({required String username, required String full_name, required String email, required String password}) async {
//   var request = http.MultipartRequest(
//       'POST', Uri.parse('https://www.paakhealth.com/dochealth/api/signup'));
//
//   request.fields.addAll(body);
//
//   http.StreamedResponse response = await request.send();
//
//   if (response.statusCode == 200) {
//     print(await response.stream.bytesToString());
//
//   } else {
//     print(response.reasonPhrase);
//   }
// }
}
