// To parse this JSON data, do
//
//     final friendListModel = friendListModelFromJson(jsonString);

import 'dart:convert';

import 'my_profile_model.dart';

FriendListModel friendListModelFromJson(String str) => FriendListModel.fromJson(json.decode(str));

String friendListModelToJson(FriendListModel data) => json.encode(data.toJson());

class FriendListModel {
  FriendListModel({
    this.status,
    this.users,
  });

  final bool? status;
  final List<User>? users;


  factory FriendListModel.fromJson(Map<String, dynamic> json){
    List friends = json["friends"] ?? [];
    friends.removeWhere((element) => element == null);
    return FriendListModel(
      status: json["status"],
      users:  List<User>.from(friends.map((x){

        return User.fromJson(x);
      })),
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "friends": users == null ? [] : List<dynamic>.from(users!.map((x) => x.toJson())),
      };
}