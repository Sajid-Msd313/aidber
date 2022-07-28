// To parse this JSON data, do
//
//     final innovationResponseModel = innovationResponseModelFromJson(jsonString);

import 'dart:convert';

import '../../screens/innovations/widgets/innovation_item.dart';
import 'innovation_item_model.dart';

InnovationResponseModel innovationResponseModelFromJson(String str) => InnovationResponseModel.fromJson(json.decode(str));

String innovationResponseModelToJson(InnovationResponseModel data) => json.encode(data.toJson());

class InnovationResponseModel {
  InnovationResponseModel({
    this.status,
    this.data,
  });

  final  status;
  final Data? data;

  factory InnovationResponseModel.fromJson(Map<String, dynamic> json) => InnovationResponseModel(
    status: json["status"],
    data: json["data"] == null?null : Data.fromJson(json["data"]),
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
  final List<InnovationItemModel>? data;
  final String? firstPageUrl;
  final int? from;
  final dynamic? nextPageUrl;
  final String? path;
  final int? perPage;
  final dynamic? prevPageUrl;
  final int? to;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    currentPage: json["current_page"],
    data: json["data"] == null? [] :  List<InnovationItemModel>.from(json["data"].map((x) => InnovationItemModel.fromJson(x))),
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
    "data": data == null? [] :  List<dynamic>.from(data!.map((x) => x.toJson())),
    "first_page_url": firstPageUrl,
    "from": from,
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
  };
}