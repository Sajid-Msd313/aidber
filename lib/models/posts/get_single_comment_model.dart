// To parse this JSON data, do
//
//     final singleComment = singleCommentFromJson(jsonString);

import 'dart:convert';

List<SingleComment> singleCommentFromJson(String str) => List<SingleComment>.from(json.decode(str).map((x) => SingleComment.fromJson(x)));

String singleCommentToJson(List<SingleComment> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SingleComment {
  SingleComment({
    this.id,
    this.userId,
    this.caption,
    this.image,
    this.latitude,
    this.longitude,
    this.type,
    this.postUrl,
    this.link,
    this.isShared,
    this.sharedAt,
    this.createdAt,
    this.updatedAt,
    this.comments,
  });

  int? id;
  String? userId;
  String? caption;
  dynamic? image;
  String? latitude;
  String? longitude;
  String? type;
  dynamic? postUrl;
  dynamic? link;
  String? isShared;
  dynamic? sharedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Comment>? comments;

  factory SingleComment.fromJson(Map<String, dynamic> json) => SingleComment(
    id: json["id"],
    userId: json["user_id"],
    caption: json["caption"],
    image: json["image"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    type: json["type"],
    postUrl: json["post_url"],
    link: json["link"],
    isShared: json["is_shared"],
    sharedAt: json["shared_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    comments: json["comments"] == null? [] : List<Comment>.from(json["comments"].map((x) => Comment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "caption": caption,
    "image": image,
    "latitude": latitude,
    "longitude": longitude,
    "type": type,
    "post_url": postUrl,
    "link": link,
    "is_shared": isShared,
    "shared_at": sharedAt,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "comments": comments == null? [] : List<dynamic>.from(comments!.map((x) => x.toJson())),
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
    replyTo: json["reply_to"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    replies: json["replies"] == null ? [] : List<Comment>.from(json["replies"].map((x) => Comment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "post_id": postId,
    "user_id": userId,
    "content": content,
    "reply_to": replyTo,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "replies":  replies == null?[]:      List<dynamic>.from(replies!.map((x) => x.toJson())),
  };
}
