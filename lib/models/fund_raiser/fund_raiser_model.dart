// To parse this JSON data, do
//
//     final fundRaiserModel = fundRaiserModelFromJson(jsonString);

import 'dart:convert';

FundRaiserModel fundRaiserModelFromJson(String str) => FundRaiserModel.fromJson(json.decode(str));

String fundRaiserModelToJson(FundRaiserModel data) => json.encode(data.toJson());

class FundRaiserModel {
  FundRaiserModel({
    this.status,
    this.data,
  });

  final bool? status;
  final Data? data;

  factory FundRaiserModel.fromJson(Map<String, dynamic> json) => FundRaiserModel(
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

  final int? currentPage;
  final List<SingleFundModel>? data;
  final String? firstPageUrl;
  final int? from;
  final dynamic? nextPageUrl;
  final String? path;
  final int? perPage;
  final dynamic? prevPageUrl;
  final int? to;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        currentPage: json["current_page"],
        data: List<SingleFundModel>.from(json["data"].map((x) => SingleFundModel.fromJson(x))),
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
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
      };
}

class SingleFundModel {
  SingleFundModel({
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

  factory SingleFundModel.fromJson(Map<String, dynamic> json) => SingleFundModel(
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
        fundRaiserImages: json["fund_raiser_images"] == null
            ? []
            : List<FundRaiser>.from(json["fund_raiser_images"].map((x) => FundRaiser.fromJson(x))),
        fundRaiserVideos: json["fund_raiser_videos"] == null
            ? []
            : List<FundRaiser>.from(json["fund_raiser_videos"].map((x) => FundRaiser.fromJson(x))),
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
        "fund_raiser_images": fundRaiserImages == null ? [] : List<dynamic>.from(fundRaiserImages!.map((x) => x.toJson())),
        "fund_raiser_videos": fundRaiserVideos == null ? [] : List<dynamic>.from(fundRaiserVideos!.map((x) => x.toJson())),
      };
}

class FundRaiser {
  FundRaiser({
    this.id,
    this.userId,
    this.postId,
    this.innovationId,
    this.fundRaiserId,
    this.content,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final String? userId;
  final dynamic? postId;
  final dynamic? innovationId;
  final String? fundRaiserId;

  final String? content;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory FundRaiser.fromJson(Map<String, dynamic> json) => FundRaiser(
        id: json["id"],
        userId: json["user_id"],
        postId: json["post_id"],
        innovationId: json["innovation_id"],
        fundRaiserId: json["fund_raiser_id"],
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
        "content": content,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}