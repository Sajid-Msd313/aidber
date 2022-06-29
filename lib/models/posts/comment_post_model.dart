// To parse this JSON data, do
//
//     final commentPostModel = commentPostModelFromJson(jsonString);

import 'dart:convert';

import 'get_single_comment_model.dart';

CommentPostModel commentPostModelFromJson(String str) => CommentPostModel.fromJson(json.decode(str));

String commentPostModelToJson(CommentPostModel data) => json.encode(data.toJson());

class CommentPostModel {
  CommentPostModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  Comment? data;

  factory CommentPostModel.fromJson(Map<String, dynamic> json) => CommentPostModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null? null : Comment.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

