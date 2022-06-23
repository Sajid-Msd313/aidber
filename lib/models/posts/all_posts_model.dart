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

  List<Datum>? data;
  String? msg;
  bool? status;

  factory GetAllPost.fromJson(Map<String, dynamic> json) => GetAllPost(
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    msg: json["msg"] == null ? null : json["msg"],
    status: json["status"] == null ? null : json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
    "msg": msg == null ? null : msg,
    "status": status == null ? null : status,
  };
}

class Datum {
  Datum({
    this.id,
    this.userId,
    this.caption,
    this.image,
    this.latitude,
    this.longitude,
    this.type,
    this.postUrl,
    this.link,
    this.createdAt,
    this.updatedAt,
    this.user,
    this.isLiked,
  });

  int? id;
  String? userId;
  String? caption;
  dynamic? image;
  String? latitude;
  String? longitude;
  String? type;
  String? postUrl;
  String? link;
  DateTime? createdAt;
  DateTime? updatedAt;
  User? user;
  int? isLiked;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    isLiked:  -1,
    id: json["id"] == null ? null : json["id"],
    userId: json["user_id"] == null ? null : json["user_id"],
    caption: json["caption"] == null ? null : json["caption"],
    image: json["image"],
    latitude: json["latitude"] == null ? null : json["latitude"],
    longitude: json["longitude"] == null ? null : json["longitude"],
    type: json["type"] == null ? null : json["type"],
    postUrl: json["post_url"] == null ? null : json["post_url"],
    link: json["link"] == null ? null : json["link"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "user_id": userId == null ? null : userId,
    "caption": caption == null ? null : caption,
    "image": image,
    "latitude": latitude == null ? null : latitude,
    "longitude": longitude == null ? null : longitude,
    "type": type == null ? null : type,
    "post_url": postUrl == null ? null : postUrl,
    "link": link == null ? null : link,
    "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt?.toIso8601String(),
    "user": user == null ? null : user?.toJson(),
  };
}

class User {
  User({
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
    this.profilePictureUrl,
    this.birthDate,
    this.isBlocked,
    this.isVerified,
    this.createdAt,
    this.updatedAt,
    this.active,
    this.deviceToken,
    this.isActive,
  });

  int? id;
  String? userType;
  dynamic? email;
  dynamic? username;
  dynamic? fullName;
  dynamic? firstName;
  dynamic? lastName;
  String? phone;
  String? gender;
  dynamic? city;
  dynamic? state;
  dynamic? country;
  dynamic? occupation;
  dynamic? about;
  dynamic? profilePictureUrl;
  dynamic? birthDate;
  String? isBlocked;
  String? isVerified;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic? active;
  dynamic? deviceToken;
  String? isActive;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"] == null ? null : json["id"],
    userType: json["user_type"] == null ? null : json["user_type"],
    email: json["email"] == null ? null : json["email"],
    username: json["username"] == null ? null :json["username"],
    fullName: json["full_name"] == null ? null : json["full_name"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    phone: json["phone"] == null ? null : json["phone"],
    gender: json["gender"] == null ? null : json["gender"],
    city: json["city"],
    state: json["state"],
    country: json["country"],
    occupation: json["occupation"],
    about: json["about"],
    profilePictureUrl: json["profile_picture_url"],
    birthDate: json["birth_date"],
    isBlocked: json["is_blocked"] == null ? null : json["is_blocked"],
    isVerified: json["is_verified"] == null ? null : json["is_verified"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    active: json["active"],
    deviceToken: json["device_token"] == null ? null : json["device_token"],
    isActive: json["is_active"] == null ? null : json["is_active"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "user_type": userType == null ? null : userType,
    "email": email == null ? null : email,
    "username": username == null ? null : username,
    "full_name": fullName == null ? null : fullName,
    "first_name": firstName,
    "last_name": lastName,
    "phone": phone == null ? null : phone,
    "gender": gender == null ? null : gender,
    "city": city,
    "state": state,
    "country": country,
    "occupation": occupation,
    "about": about,
    "profile_picture_url": profilePictureUrl,
    "birth_date": birthDate,
    "is_blocked": isBlocked == null ? null : isBlocked,
    "is_verified": isVerified == null ? null : isVerified,
    "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt?.toIso8601String(),
    "active": active,
    "device_token": deviceToken == null ? null : deviceToken,
    "is_active": isActive == null ? null : isActive,
  };
}


