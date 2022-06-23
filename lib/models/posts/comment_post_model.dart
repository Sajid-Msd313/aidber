// To parse this JSON data, do
//
//     final commentPostModel = commentPostModelFromJson(jsonString);

import 'dart:convert';

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
  Data? data;

  factory CommentPostModel.fromJson(Map<String, dynamic> json) => CommentPostModel(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
    "data": data == null ? null : data?.toJson(),
  };
}

class Data {
  Data({
    this.postId,
    this.userId,
    this.content,
    this.replyTo,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  String? postId;
  String? userId;
  String? content;
  dynamic? replyTo;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    postId: json["post_id"] == null ? null : json["post_id"],
    userId: json["user_id"] == null ? null : json["user_id"],
    content: json["content"] == null ? null : json["content"],
    replyTo: json["reply_to"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    id: json["id"] == null ? null : json["id"],
  );

  Map<String, dynamic> toJson() => {
    "post_id": postId == null ? null : postId,
    "user_id": userId == null ? null : userId,
    "content": content == null ? null : content,
    "reply_to": replyTo,
    "updated_at": updatedAt == null ? null : updatedAt?.toIso8601String(),
    "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
    "id": id == null ? null : id,
  };
}
