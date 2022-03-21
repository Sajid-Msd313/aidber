// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.status,
    this.msg,
    this.result,
  });

  String? status;
  String? msg;
  Result? result;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    status: json["status"] == null ? null : json["status"],
    msg: json["msg"] == null ? null : json["msg"],
    result: json["result"] == null ? null : Result.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "msg": msg == null ? null : msg,
    "result": result == null ? null : result!.toJson(),
  };
}

class Result {
  Result({
    this.userId,
    this.userName,
    this.userImage,
    this.token,
    this.refreshToken,
    this.expiryTime,
  });

  int? userId;
  String? userName;
  dynamic? userImage;
  String? token;
  String? refreshToken;
  int? expiryTime;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    userId: json["user_id"] ?? null,
    userName: json["user_name"] ?? null,
    userImage: json["user_image"],
    token: json["token"] ?? null,
    refreshToken: json["refresh_token"] ?? null,
    expiryTime: json["expiry_time"] ?? null,
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId ?? null,
    "user_name": userName ?? null,
    "user_image": userImage,
    "token": token ?? null,
    "refresh_token": refreshToken ?? null,
    "expiry_time": expiryTime ?? null,
  };
}
