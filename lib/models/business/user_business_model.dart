// To parse this JSON data, do
//
//     final userBusinessModel = userBusinessModelFromJson(jsonString);

import 'dart:convert';

import 'package:aidber/models/posts/all_posts_model.dart';

//mainly used for get user business....
UserBusinessModel userBusinessModelFromJson(String str) => UserBusinessModel.fromJson(json.decode(str));

String userBusinessModelToJson(UserBusinessModel data) => json.encode(data.toJson());

class UserBusinessModel {
  UserBusinessModel({
    this.status,
    this.data,
  });

  bool? status;
  Data? data;

  factory UserBusinessModel.fromJson(Map<String, dynamic> json) => UserBusinessModel(
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
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
  List<BusinessItem>? data;
  String? firstPageUrl;
  int? from;
  dynamic? nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        currentPage: json["current_page"],
        data: json["data"] == null ? [] : List<BusinessItem>.from(json["data"].map((x) => BusinessItem.fromJson(x))),
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
        "data": data == null ? [] : List<BusinessItem>.from(data!.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
      };
}

class BusinessItem {
  BusinessItem({
    this.id,
    this.businessName,
    this.businessTagline,
    this.website,
    this.industry,
    this.location,
    this.companySize,
    this.yearOfFoundation,
    this.about,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.posts,
    this.profilePicture,
    this.followersCount,
  });

  int? id;
  String? businessName;
  String? businessTagline;
  String? website;
  String? industry;
  String? location;
  String? companySize;
  String? yearOfFoundation;
  String? about;
  String? userId;
  String? followersCount;
  String? profilePicture;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Posts>? posts;

  factory BusinessItem.fromJson(Map<String, dynamic> json) => BusinessItem(
        id: json["id"],
        businessName: json["business_name"],
        businessTagline: json["business_tagline"],
        website: json["website"],
        industry: json["industry"],
        location: json["location"],
        companySize: json["company_size"],
        yearOfFoundation: json["year_of_foundation"],
        about: json["about"],
        userId: json["user_id"],
        followersCount: json["followers_count"],
        profilePicture: json["user"]["profile_picture_url"] ?? "",
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        posts: json["posts"] == null ? [] : List<Posts>.from(json["posts"].map((x) => Posts.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "business_name": businessName,
        "business_tagline": businessTagline,
        "website": website,
        "industry": industry,
        "location": location,
        "company_size": companySize,
        "year_of_foundation": yearOfFoundation,
        "followers_count": followersCount,
        "about": about,
        "user_id": userId,
    "profile_picture_url" : profilePicture,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "posts": posts == null ? [] : List<Posts>.from(posts!.map((x) => x.toJson())),
      };
}