// To parse this JSON data, do
//
//     final fundRaiserDetailModel = fundRaiserDetailModelFromJson(jsonString);

import 'dart:convert';

FundRaiserDetailModel fundRaiserDetailModelFromJson(String str) => FundRaiserDetailModel.fromJson(json.decode(str));

String fundRaiserDetailModelToJson(FundRaiserDetailModel data) => json.encode(data.toJson());

class FundRaiserDetailModel {
  FundRaiserDetailModel({
    this.status,
    this.data,
  });

  final bool? status;
  final Data? data;

  factory FundRaiserDetailModel.fromJson(Map<String, dynamic> json) => FundRaiserDetailModel(
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
    this.id,
    this.title,
    this.fundRaiserDesc,
    this.organisationName,
    this.amount,
    this.bank,
    this.accountNumber,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.fundRaiserImages,
    this.fundRaiserVideos,
  });

  final int? id;
  final String? title;
  final String? fundRaiserDesc;
  final String? organisationName;
  final String? amount;
  final String? bank;
  final String? accountNumber;
  final String? userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<FundRaiser>? fundRaiserImages;
  final List<FundRaiser>? fundRaiserVideos;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    title: json["title"],
    fundRaiserDesc: json["fund_raiser_desc"],
    organisationName: json["organisation_name"],
    amount: json["amount"],
    bank: json["bank"],
    accountNumber: json["account_number"],
    userId: json["user_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    fundRaiserImages:json["fund_raiser_images"] == null? [] : List<FundRaiser>.from(json["fund_raiser_images"].map((x) => FundRaiser
        .fromJson
      (x))),
    fundRaiserVideos:json["fund_raiser_videos"] == null? [] :  List<FundRaiser>.from(json["fund_raiser_videos"].map((x) => FundRaiser
        .fromJson
      (x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "fund_raiser_desc": fundRaiserDesc,
    "organisation_name": organisationName,
    "amount": amount,
    "bank": bank,
    "account_number": accountNumber,
    "user_id": userId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "fund_raiser_images": fundRaiserImages == null? [] : List<dynamic>.from(fundRaiserImages!.map((x) => x.toJson())),
    "fund_raiser_videos":fundRaiserVideos == null? [] : List<dynamic>.from(fundRaiserVideos!.map((x) => x.toJson())),
  };
}

class FundRaiser {
  FundRaiser({
    this.id,
    this.userId,
    this.postId,
    this.innovationId,
    this.fundRaiserId,
    this.contentType,
    this.mediaFor,
    this.content,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final String? userId;
  final dynamic? postId;
  final dynamic? innovationId;
  final String? fundRaiserId;
  final String? contentType;
  final String? mediaFor;
  final String? content;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory FundRaiser.fromJson(Map<String, dynamic> json) => FundRaiser(
    id: json["id"],
    userId: json["user_id"],
    postId: json["post_id"],
    innovationId: json["innovation_id"],
    fundRaiserId: json["fund_raiser_id"],
    contentType: json["content_type"],
    mediaFor: json["media_for"],
    content: json["content"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "post_id": postId,
    "innovation_id": innovationId,
    "fund_raiser_id": fundRaiserId,
    "content_type": contentType,
    "media_for": mediaFor,
    "content": content,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}