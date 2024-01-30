// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

NotificationModel notificationModelFromJson(String str) => NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) => json.encode(data.toJson());

class NotificationModel {
    int success;
    String status;
    String message;
    int totalCount;
    List<Datum> data;

    NotificationModel({
        required this.success,
        required this.status,
        required this.message,
        required this.totalCount,
        required this.data,
    });

    factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
        success: json["success"],
        status: json["status"],
        message: json["message"],
        totalCount: json["TotalCount"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
        "TotalCount": totalCount,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String id;
    String date;
    String staff;
    String description;

    Datum({
        required this.id,
        required this.date,
        required this.staff,
        required this.description,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        date: json["date"],
        staff:  json["staff"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "date": date,
        "staff":  staff,
        "description": description,
    };
}

 
 
 
