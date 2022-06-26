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
  Comment? data;

  factory CommentPostModel.fromJson(Map<String, dynamic> json) => CommentPostModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Comment.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? null : data?.toJson(),
  };
}
class Comment {
  Comment({
    this.id,
    this.postId,
    this.userId,
    this.content,
    this.replyTo,
    this.createdAt,
    this.updatedAt,
    this.replies,
  });

  int? id;
  String? postId;
  String? userId;
  String? content;
  String? replyTo;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Comment>? replies;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    id: json["id"],
    postId: json["post_id"],
    userId: json["user_id"],
    content: json["content"],
    replyTo: json["reply_to"] ?? [],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    replies: json["replies"] == null ? [] : List<Comment>.from(json["replies"].map((x) => Comment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "post_id": postId,
    "user_id": userId,
    "content": content,
    "reply_to": replyTo ?? [],
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "replies": replies == null ? [] : List<dynamic>.from(replies!.map((x) => x.toJson())),
  };
}
