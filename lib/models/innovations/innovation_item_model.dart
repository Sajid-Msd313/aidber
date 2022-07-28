// To parse this JSON data, do
//
//     final innovationResponseModel = innovationResponseModelFromJson(jsonString);

import 'dart:convert';


class InnovationItemModel {
  InnovationItemModel({
    this.title,
    this.category,
    this.link,
    this.description,
    this.userId,
    this.status,
    this.updatedAt,
    this.createdAt,
    this.id,
    this.innovationImages,
    this.innovationVideos,
    this.innovationFiles,
  });

  final String? title;
  final String? category;
  final String? link;
  final String? description;
  final String? userId;
  final String? status;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;
  final List<InnovationContent>? innovationImages;
  final List<InnovationContent>? innovationVideos;
  final List<InnovationContent>? innovationFiles;

  factory InnovationItemModel.fromJson(Map<String, dynamic> json) => InnovationItemModel(
        title: json["title"],
        category: json["category"],
        link: json["link"],
        description: json["description"],
        userId: json["user_id"],
        status: json["status"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
        innovationImages: json["innovation_images"] == null
            ? []
            : List<InnovationContent>.from(json["innovation_images"].map((x) => InnovationContent.fromJson(x))),
        innovationVideos: json["innovation_videos"] == null
            ? []
            : List<InnovationContent>.from(json["innovation_videos"].map((x) => InnovationContent.fromJson(x))),
        innovationFiles: json["innovation_files"] == null
            ? []
            : List<InnovationContent>.from(json["innovation_files"].map((x) => InnovationContent.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "category": category,
        "link": link,
        "description": description,
        "user_id": userId,
        "status": status,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
        "innovation_images": innovationImages == null ? [] : List<dynamic>.from(innovationImages!.map((x) => x.toJson())),
        "innovation_videos": innovationVideos == null ? [] : List<dynamic>.from(innovationVideos!.map((x) => x.toJson())),
        "innovation_files": innovationFiles == null ? [] : List<dynamic>.from(innovationFiles!.map((x) => x.toJson())),
      };
}

class InnovationContent {
  InnovationContent({
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
  final String? innovationId;
  final dynamic? fundRaiserId;
  final String? contentType;
  final String? mediaFor;
  final String? content;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory InnovationContent.fromJson(Map<String, dynamic> json) => InnovationContent(
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