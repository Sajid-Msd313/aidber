// To parse this JSON data, do
//
//     final myProfileModel = myProfileModelFromJson(jsonString);

import 'dart:convert';

import '../posts/all_posts_model.dart';

MyProfileModel myProfileModelFromJson(String str) => MyProfileModel.fromJson(json.decode(str));

String myProfileModelToJson(MyProfileModel data) => json.encode(data.toJson());

class MyProfileModel {
  MyProfileModel({
    this.status,
    this.data,
  });

  bool? status;
  Data? data;

  factory MyProfileModel.fromJson(Map<String, dynamic> json) => MyProfileModel(
    status: json["status"],
    data:json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.userType,
    this.email,
    this.username,
    this.fullName,
    this.firstName,
    this.lastName,
    this.phone,
    this.gender,
    this.city,
    this.state,
    this.country,
    this.occupation,
    this.about,
    this.address,
    this.work,
    this.profilePictureUrl,
    this.birthDate,
    this.isBlocked,
    this.isVerified,
    this.createdAt,
    this.updatedAt,
    this.active,
    this.deviceToken,
    this.isActive,
    this.followers,
    this.following,
    this.posts,
  });

  int? id;
  String? userType;
  String? email;
  String? username;
  String? fullName;
  String? firstName;
  String? lastName;
  dynamic? phone;
  String? gender;
  String? city;
  String? state;
  String? country;
  String? occupation;
  String? about;
  String? address;
  String? work;
  String? profilePictureUrl;
  dynamic birthDate;
  String? isBlocked;
  String? isVerified;
  String? createdAt;
  DateTime? updatedAt;
  dynamic active;
  String? deviceToken;
  String? isActive;
  int? followers;
  int? following;
  List<Posts>? posts;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    userType: json["user_type"],
    email: json["email"],
    username: json["username"],
    fullName: json["full_name"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    phone: json["phone"],
    gender: json["gender"],
    city: json["city"],
    state: json["state"],
    country: json["country"],
    occupation: json["occupation"],
    about: json["about"],
    address: json["address"],
    work: json["work"],
    profilePictureUrl: json["profile_picture_url"],
    birthDate: json["birth_date"],
    isBlocked: json["is_blocked"],
    isVerified: json["is_verified"],
    createdAt: json["created_at"],
    updatedAt:json["updated_at"]  == null? null : DateTime.parse(json["updated_at"]),
    active: json["active"],
    deviceToken: json["device_token"],
    isActive: json["is_active"],
    followers: json["followers"] ?? 0,
    following: json["following"] ?? 0,
    posts:json["posts"] == null? [] :  List<Posts>.from(json["posts"].map((x) => Posts.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_type": userType,
    "email": email,
    "username": username,
    "full_name": fullName,
    "first_name": firstName,
    "last_name": lastName,
    "phone": phone,
    "gender": gender,
    "city": city,
    "state": state,
    "country": country,
    "occupation": occupation,
    "about": about,
    "address": address,
    "work": work,
    "profile_picture_url": profilePictureUrl,
    "birth_date": birthDate,
    "is_blocked": isBlocked,
    "is_verified": isVerified,
    "created_at": createdAt,
    "updated_at": updatedAt?.toIso8601String(),
    "active": active,
    "device_token": deviceToken,
    "is_active": isActive,
    "followers": followers ?? 0,
    "following": following ?? 0,
    "posts":posts == null? [] : List<dynamic>.from(posts!.map((x) => x.toJson())),
  };
}
