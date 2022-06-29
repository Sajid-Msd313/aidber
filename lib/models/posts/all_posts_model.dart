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

  Data? data;
  String? msg;
  bool? status;

  factory GetAllPost.fromJson(Map<String, dynamic> json) => GetAllPost(
    data: Data.fromJson(json["data"]),
    msg: json["msg"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "msg": msg,
    "status": status,
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
  List<Posts>? data;
  String? firstPageUrl;
  int? from;
  String? nextPageUrl;
  String? path;
  int? perPage;
  dynamic? prevPageUrl;
  int? to;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    currentPage: json["current_page"],
    data: json["data"] == null?[] : List<Posts>.from(json["data"].map((x) => Posts.fromJson(x))),
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
    "data": data == null || data!.isEmpty?[]: List<dynamic>.from(data!.map((x) => x.toJson())),
    "first_page_url": firstPageUrl,
    "from": from,
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
  };
}

class Posts {
  Posts({
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
    this.user,
    this.isLiked,
    this.isSaved,
  });

  int? id;
  String? userId;
  String ?caption;
  dynamic? image;
  String? latitude;
  String? longitude;
  String? type;
  String? postUrl;
  String? link;
  String? isShared;
  dynamic? sharedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  User? user;
  IsLiked? isLiked;
  dynamic? isSaved;

  factory Posts.fromJson(Map<String, dynamic> json) => Posts(
    id: json["id"],
    userId: json["user_id"],
    caption: json["caption"],
    image: json["image"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    type:json["type"],
    postUrl: json["post_url"],
    link: json["link"],
    isShared: json["is_shared"],
    sharedAt: json["shared_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    user:json["user"] == null? null : User.fromJson(json["user"]),
    isLiked: json["is_liked"] == null ? null : IsLiked.fromJson(json["is_liked"]),
    isSaved: json["is_saved"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "caption": caption,
    "image": image,
    "latitude": latitude,
    "longitude": longitude,
    "type": type,
    "post_url":postUrl,
    "link":link,
    "is_shared": isShared,
    "shared_at": sharedAt,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "user": user?.toJson(),
    "is_liked": isLiked == null ? null : isLiked?.toJson(),
    "is_saved": isSaved,
  };
}

class IsLiked {
  IsLiked({
    this.id,
    this.likeType,
    this.userId,
    this.postId,
    this.dateCreated,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  LikeType? likeType;
  String? userId;
  String? postId;
  DateTime? dateCreated;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory IsLiked.fromJson(Map<String, dynamic> json) => IsLiked(
    id: json["id"],
    likeType:json["like_type"] == null? null : LikeType.fromJson(json["like_type"]),
    userId: json["user_id"],
    postId: json["post_id"],
    dateCreated: DateTime.parse(json["date_created"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "like_type": likeType?.toJson(),
    "user_id": userId,
    "post_id": postId,
    "date_created": "${dateCreated?.year.toString().padLeft(4, '0')}-${dateCreated?.month.toString().padLeft(2, '0')}-${dateCreated?.day.toString().padLeft(2, '0')}",
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
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
    "id": id,
    "like_type": likeType,
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
  });

  int? id;
  String? userType;
  String? email;
  String? username;
  String? fullName;
  String? firstName;
  String? lastName;
  String? phone;
  String? gender;
  String? city;
  String? state;
  String? country;
  String? occupation;
  String? about;
  String? address;
  String? work;
  String? profilePictureUrl;
  dynamic? birthDate;
  String? isBlocked;
  String? isVerified;
  String? createdAt;
  DateTime? updatedAt;
  dynamic? active;
  String? deviceToken;
  String? isActive;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    userType: json["user_type"],
    email: json["email"],
    username:json["username"],
    fullName: json["full_name"],
    firstName: json["first_name"] ,
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
    updatedAt: DateTime.parse(json["updated_at"]),
    active: json["active"],
    deviceToken: json["device_token"],
    isActive: json["is_active"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_type": userType,
    "email":email,
    "username":username,
    "full_name": fullName,
    "first_name":  firstName,
    "last_name":  lastName,
    "phone":  phone,
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
  };
}


