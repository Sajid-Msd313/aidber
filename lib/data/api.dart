import 'dart:convert';
import 'dart:io';

import 'package:aidber/controllers/storage_controller/storage_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import 'package:image_picker/image_picker.dart';

class ApiClient extends GetxService {
  final String appBaseUrl;
  final storage_controller storageController;
  static final String noInternetMessage =
      'Connection to API server failed due to internet connection';
  final int timeoutInSeconds = 30;

  String? _token;

  String get token => storageController.box.read("token")??"";

  set token(String value) {
    _token = value;
  }

  Map<String, String>? _mainHeaders;

  ApiClient({required this.appBaseUrl, required this.storageController}) {
    print(storageController.box.read("token"));
    token = storageController.box.read("token") ?? "";
    debugPrint('Token: $token');

    updateHeader(
      token.toString(),
    );
  }

  void updateHeader(String token) {
    _mainHeaders = {
      'Authorization': 'x-api-token $token',
    };
  }

  Future<Response> getData(String uri,
      {Map<String, dynamic>? query, Map<String, String>? headers}) async {
    try {
      if (kDebugMode) {
        print('====> API Call: $uri\nToken: $token');
      }
      Http.Response _response = await Http.get(
        Uri.parse(appBaseUrl + uri),
        headers: headers ?? _mainHeaders,
      ).timeout(Duration(seconds: timeoutInSeconds));
      Response response = handleResponse(_response);
      if (kDebugMode) {
        print(
            '====> API Response: [${response.statusCode}] $uri\n${response.body}');
      }
      return response;
    } catch (e) {
      print(e);
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> postData(String uri, dynamic body,
      {Map<String, String>? headers}) async {
    try {
      if (kDebugMode) {
        print('====> API Calla: $uri\nToken: $token');
        print('====> API Body:: $body');
        print("headers::: ${headers ?? _mainHeaders}");
      }
      Http.Response _response = await Http.post(
        Uri.parse(uri),
        body: body,
        headers: headers ?? _mainHeaders,
      ).timeout(Duration(seconds: timeoutInSeconds));
      Response response = handleResponse(_response);
      if (kDebugMode) {
        print("---> headers ${headers}");
        print(
            '====> API Responsea: [${response.statusCode}] $uri \n${response.body.toString()}');
      }
      return response;
    } catch (e) {
      print("catched from apiclient" + e.toString());
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> postMultipartData(
      String uri, Map<String, String> body, List<MultipartBody>? multipartBody,
      {Map<String, String>? headers}) async {
    try {
      if (kDebugMode) {
        print('====> API Call: $uri\nToken: $token');
        print('====> API Body: $body');
      }
      Http.MultipartRequest _request =
          Http.MultipartRequest('POST', Uri.parse(appBaseUrl + uri));
      _request.headers.addAll(headers ?? _mainHeaders!);
      for (MultipartBody multipart in multipartBody!) {
        if (multipart.file != null) {
          File _file = File(multipart.file!.path);
          _request.files.add(Http.MultipartFile(
            multipart.key!,
            _file.readAsBytes().asStream(),
            _file.lengthSync(),
            filename: _file.path.split('/').last,
          ));
        }
      }
      _request.fields.addAll(body);

      Http.Response _response =
          await Http.Response.fromStream(await _request.send());
      Response response = handleResponse(_response);
      if (kDebugMode) {
        print(
            '====> API Response: [${response.statusCode}] $uri\n${response.body}');
      }
      return response;
    } catch (e) {
      print(e);
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> putData(String uri, dynamic body,
      {Map<String, String>? headers}) async {
    try {
      if (kDebugMode) {
        print('====> API Call: $uri\nToken: $token');
        print('====> API Body: $body');
      }
      Http.Response _response = await Http.put(
        Uri.parse(appBaseUrl + uri),
        body: jsonEncode(body),
        headers: headers ?? _mainHeaders,
      ).timeout(Duration(seconds: timeoutInSeconds));
      Response response = handleResponse(_response);
      if (kDebugMode) {
        print(
            '====> API Response: [${response.statusCode}] $uri\n${response.body}');
      }
      return response;
    } catch (e) {
      print(e);
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> deleteData(String uri,
      {Map<String, String>? headers}) async {
    try {
      if (kDebugMode) {
        print('====> API Call: $uri\nToken: $token');
      }
      Http.Response _response = await Http.delete(
        Uri.parse(appBaseUrl + uri),
        headers: headers ?? _mainHeaders,
      ).timeout(Duration(seconds: timeoutInSeconds));
      Response response = handleResponse(_response);
      if (kDebugMode) {
        print(
            '====> API Response: [${response.statusCode}] $uri\n${response.body}');
      }
      return response;
    } catch (e) {
      debugPrint(e.toString());
      return Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Response handleResponse(Http.Response response) {
    dynamic _body;
    try {
      _body = jsonDecode(response.body);
    } catch (e) {}
    Response _response = Response(
      body: _body ?? response.body,
      bodyString: response.body.toString(),
      headers: response.headers,
      statusCode: response.statusCode,
      statusText: response.reasonPhrase,
    );
    print("CHECK RESP ${_response.body}");
    if (_response.isOk && _body["status"].toString() == "0") {
      Error _errorResponse = Error.fromJson(_response.body);
      _response = Response(
          statusCode: 0,
          body: _response.body,
          statusText: _errorResponse.msg);
      print("returning here ");
      return _response;
    }
    if (_response.statusCode != 200 &&
        _response.body != null &&
        _response.body is! String) {
      if (_response.body.toString().startsWith('{"msg":')) {
        Error _errorResponse = Error.fromJson(_response.body);
        _response = Response(
            statusCode: _response.statusCode,
            body: _response.body,
            statusText: _errorResponse.msg);
      } else if (_response.body.toString().startsWith('{"status": "0"')) {
        _response = Response(
            statusCode: _response.statusCode,
            body: _response.body,
            statusText: _response.body['message']);
      }
    } else if (_response.statusCode != 200 && _response.body == null) {
      _response = Response(statusCode: 0, statusText: noInternetMessage);
    }
    return _response;
  }
}

class MultipartBody {
  String? key;
  XFile? file;

  MultipartBody(this.key, this.file);
}

// To parse this JSON data, do
//
//     final error = errorFromJson(jsonString);

Error errorFromJson(String str) => Error.fromJson(json.decode(str));

String errorToJson(Error data) => json.encode(data.toJson());

class Error {
  Error({
    this.msg,
    this.status,
  });

  String? msg;
  String? status;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        msg: json["msg"] == null ? null : json["msg"],
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toJson() => {
        "msg": msg == null ? null : msg,
        "status": status == null ? null : status,
      };
}
