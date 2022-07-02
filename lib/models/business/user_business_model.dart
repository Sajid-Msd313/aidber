import 'dart:convert';

import '../posts/all_posts_model.dart';

UserBusinessModel userBusinessModelFromJson(String str) => UserBusinessModel.fromJson(json.decode(str));

String userBusinessModelToJson(UserBusinessModel data) => json.encode(data.toJson());

class UserBusinessModel {
  UserBusinessModel({
    this.status,
    this.data,
  });

  bool? status;
  List<BusinessItem>? data;

  factory UserBusinessModel.fromJson(Map<String, dynamic> json) => UserBusinessModel(
    status: json["status"],
    data:json["data"] == null? [] :  List<BusinessItem>.from(json["data"].map((x) => BusinessItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data == null? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
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
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    posts: json["posts"] == null? [] : List<Posts>.from(json["posts"].map((x) =>  Posts.fromJson(x))),
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
    "about": about,
    "user_id": userId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "posts": posts == null? [] :  List<Posts>.from(posts!.map((x) => x.toJson())),
  };
}
