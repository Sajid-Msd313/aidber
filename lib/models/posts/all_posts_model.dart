// To parse this JSON data, do
//
//     final getAllPost = getAllPostFromJson(jsonString);

import 'dart:convert';

GetAllPost getAllPostFromJson(String str) => GetAllPost.fromJson(json.decode(str));

String getAllPostToJson(GetAllPost data) => json.encode(data.toJson());

class GetAllPost {
  GetAllPost({
    this.data,
    this.msg,
    this.status,
  });

  List<singlePost>? data;
  String? msg;
  bool? status;

  factory GetAllPost.fromJson(Map<String, dynamic> json) => GetAllPost(
    data: json["data"] == null ? null : List<singlePost>.from(json["data"].map((x) => singlePost.fromJson(x))),
    msg: json["msg"] == null ? null : json["msg"],
    status: json["status"] == null ? null : json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
    "msg": msg == null ? null : msg,
    "status": status == null ? null : status,
  };
}

class singlePost {
  singlePost({
    this.id,
    this.userId,
    this.caption,
    this.image,
    this.latitude,
    this.longitude,
    this.type,
    this.postUrl,
    this.createdAt,
    this.updatedAt,
    this.isLiked = false,
  });

  int? id;
  bool? isLiked;
  String? userId;
  String? caption;
  String? image;
  String? latitude;
  String? longitude;
  String? type;
  String? postUrl;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory singlePost.fromJson(Map<String, dynamic> json) => singlePost(
    id: json["id"] == null ? null : json["id"],
    userId: json["user_id"] == null ? null : json["user_id"],
    caption: json["caption"] == null ? null : json["caption"],
    image: json["image"] == null ? null : json["image"],
    latitude: json["latitude"] == null ? null : json["latitude"],
    longitude: json["longitude"] == null ? null : json["longitude"],
    type: json["type"] == null ? null : json["type"],
    postUrl: json["post_url"] == null ? null : json["post_url"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "user_id": userId == null ? null : userId,
    "caption": caption == null ? null : caption,
    "image": image == null ? null : image,
    "latitude": latitude == null ? null : latitude,
    "longitude": longitude == null ? null : longitude,
    "type": type == null ? null :type,
    "post_url": postUrl == null ? null : postUrl,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
  };
}

