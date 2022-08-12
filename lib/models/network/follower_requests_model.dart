
import 'dart:convert';

import '../my_profile/my_profile_model.dart';

FollowerRequestModel followerRequestModelFromJson(String str) => FollowerRequestModel.fromJson(json.decode(str));

String followerRequestModelToJson(FollowerRequestModel data) => json.encode(data.toJson());

class FollowerRequestModel {
  FollowerRequestModel({
    this.status,
    this.userFollowerRequests,
    this.userBusinessFollowersRequests,
  });

  bool? status;
  UserRequests? userFollowerRequests;
  UserRequests? userBusinessFollowersRequests;

  factory FollowerRequestModel.fromJson(Map<String, dynamic> json) => FollowerRequestModel(
        status: json["status"],
        userFollowerRequests: UserRequests.fromJson(json["user_follower_requests"]),
        userBusinessFollowersRequests: UserRequests.fromJson(json["user_business_followers_requests"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "user_follower_requests": userFollowerRequests?.toJson(),
        "user_business_followers_requests": userBusinessFollowersRequests?.toJson(),
      };
}

class UserRequests {
  UserRequests({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
  });

  int? currentPage;
  List<Request>? data;
  String? firstPageUrl;
  int? from;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;

  factory UserRequests.fromJson(Map<String, dynamic> json) => UserRequests(
        currentPage: json["current_page"],
        data: List<Request>.from(json["data"].map((x) => Request.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": data == null ? [] : List<Request>.from(data!.map((x) => Request.fromJson(x.toJson()))),
        "first_page_url": firstPageUrl,
        "from": from,
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
      };
}

class Request {
  Request({
    this.id,
    this.userId,
    this.followerId,
    this.businessId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  int? id;
  String? userId;
  String? followerId;
  String? businessId;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  User? user;

  factory Request.fromJson(Map<String, dynamic> json) => Request(
        id: json["id"],
        userId: json["user_id"],
        followerId: json["follower_id"],
        businessId: json["business_id"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "follower_id": followerId,
        "business_id": businessId,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user": user?.toJson(),
      };
}