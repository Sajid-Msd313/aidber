import 'dart:convert';

import 'package:aidber/models/auth/signup_model.dart';
import 'package:http/http.dart' as http;
import 'package:aidber/api_urls.dart';
class signin_services {
  static var client = http.Client();

  static Future post_signin_api(
      {
        required String email,
        required String password}) async {
    Map<String, String> body = {
      'email': email,
      'password': password,
      'device_token' : "asd"
    };
    print("POST body ====> \n" +body.toString());
    var response = await client
        .post(Uri.parse(api_urls.BASE_URL + api_urls.SIGN_IN,),body: body);
    print("=======> RESPONSE BODY FOR SIGN_IN");
    print(response.body);
    try {
      if (response.statusCode == 200 && response.body.isNotEmpty) {
        final requestbody = json.decode(response.body);
       return requestbody;
      } else {
        return null;
      }
    } catch (e) {
      print("error from https://www.paakhealth.com/dochealth/api/SIGN_IN");
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
