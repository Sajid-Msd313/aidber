// To parse this JSON data, do
//
//     final likePostModel = likePostModelFromJson(jsonString);

import 'dart:convert';

import 'all_posts_model.dart';

LikePostModel likePostModelFromJson(String str) => LikePostModel.fromJson(json.decode(str));

String likePostModelToJson(LikePostModel data) => json.encode(data.toJson());

class LikePostModel {
  LikePostModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  IsLiked? data;

  factory LikePostModel.fromJson(Map<String, dynamic> json) => LikePostModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : IsLiked.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? null : data?.toJson(),
  };
}