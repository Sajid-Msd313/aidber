import 'dart:convert';

AllEventsModel allEventsModelFromJson(String str) => AllEventsModel.fromJson(json.decode(str));

String allEventsModelToJson(AllEventsModel data) => json.encode(data.toJson());

class AllEventsModel {
  AllEventsModel({
    this.status,
    this.data,
  });

  final bool? status;
  final Data? data;

  factory AllEventsModel.fromJson(Map<String, dynamic> json) => AllEventsModel(
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
  final List<Event>? data;
  final String? firstPageUrl;
  final int? from;
  final dynamic? nextPageUrl;
  final String? path;
  final int? perPage;
  final dynamic? prevPageUrl;
  final int? to;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        currentPage: json["current_page"],
        data: List<Event>.from(json["data"].map((x) => Event.fromJson(x))),
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

class Event {
  Event({
    this.id,
    this.title,
    this.description,
    this.image,
    this.date,
    this.location,
    this.lat,
    this.lng,
    this.organisedBy,
    this.time,
    this.whatToExpect,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.attendentCount
  });

  final int? id;
  final String? title;
  final String? description;
  final String? image;
  final DateTime? date;
  final String? location;
  final String? lat;
  final String? lng;
  final String? organisedBy;
  final String? time;
  final String? whatToExpect;
  final String? userId;
  final String? attendentCount;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
        date: json["date"] == null?null : DateTime.parse(json["date"]),
        location: json["location"],
        lat: json["lat"],
        lng: json["lng"],
        organisedBy: json["organised_by"],
        time: json["time"],
        whatToExpect: json["what_to_expect"],
        userId: json["user_id"],
        attendentCount: json["attendent_count"],
        createdAt: json["created_at"] != null? DateTime.parse(json["created_at"]) : null,
        updatedAt: json["updated_at"] != null? DateTime.parse(json["updated_at"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "image": image,
        "date":
            "${date?.year.toString().padLeft(4, '0')}-${date?.month.toString().padLeft(2, '0')}-${date?.day.toString().padLeft(2, '0')}",
        "location": location,
        "lat": lat,
        "lng": lng,
        "organised_by": organisedBy,
        "time": time,
        "what_to_expect": whatToExpect,
        "user_id": userId,
        "attendent_count": attendentCount,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}