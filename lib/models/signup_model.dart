// To parse this JSON data, do
//
//     final signupModel = signupModelFromJson(jsonString);

import 'dart:convert';

SignupModel signupModelFromJson(String str) => SignupModel.fromJson(json.decode(str));

String signupModelToJson(SignupModel data) => json.encode(data.toJson());

class SignupModel {
  SignupModel({
    this.status,
    this.msg,
    this.result,
  });

  String? status;
  String? msg;
  Result? result;

  factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
    status: json["status"],
    msg: json["msg"],
    result: Result.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "result": result!.toJson(),
  };
}

class Result {
  Result({
    this.token,
    this.refreshToken,
    this.expiryTime,
  });

  String? token;
  String? refreshToken;
  int? expiryTime;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    token: json["token"],
    refreshToken: json["refresh_token"],
    expiryTime: json["expiry_time"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "refresh_token": refreshToken,
    "expiry_time": expiryTime,
  };
}
