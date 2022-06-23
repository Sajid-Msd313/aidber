// To parse this JSON data, do
//
//     final likePostModel = likePostModelFromJson(jsonString);

import 'dart:convert';

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
  Data? data;

  factory LikePostModel.fromJson(Map<String, dynamic> json) => LikePostModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? null : data?.toJson(),
  };
}

class Data {
  Data({
    this.userId,
    this.postId,
    this.likeType,
    this.dateCreated,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  String? userId;
  String? postId;
  LikeType? likeType;
  DateTime? dateCreated;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userId: json["user_id"],
    postId:  json["post_id"],
    likeType: json["like_type"] == null ? null : LikeType.fromJson(json["like_type"]),
    dateCreated: json["date_created"] == null ? null : DateTime.parse(json["date_created"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId == null ? null : userId,
    "post_id": postId == null ? null : postId,
    "like_type": likeType == null ? null : likeType?.toJson(),
    "date_created": dateCreated == null ? null : dateCreated?.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt?.toIso8601String(),
    "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
    "id": id == null ? null : id,
  };
}

class LikeType {
  LikeType({
    this.id,
    this.likeType,
  });

  String? id;
  String? likeType;

  factory LikeType.fromJson(Map<String, dynamic> json) => LikeType(
    id: json["id"],
    likeType: json["like_type"],
  );

  Map<String, dynamic> toJson() => {
    "id":id,
    "like_type": likeType,
  };
}
