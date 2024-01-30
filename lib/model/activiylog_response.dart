// To parse this JSON data, do
//
//     final activityLogModel = activityLogModelFromJson(jsonString);

import 'dart:convert';

ActivityLogModel activityLogModelFromJson(String str) => ActivityLogModel.fromJson(json.decode(str));

String activityLogModelToJson(ActivityLogModel data) => json.encode(data.toJson());

class ActivityLogModel {
    int success;
    String status;
    String message;
    int totalLeadsActivity;
    List<Datum> data;

    ActivityLogModel({
        required this.success,
        required this.status,
        required this.message,
        required this.totalLeadsActivity,
        required this.data,
    });

    factory ActivityLogModel.fromJson(Map<String, dynamic> json) => ActivityLogModel(
        success: json["success"],
        status: json["status"],
        message: json["message"],
        totalLeadsActivity: json["TotalLeadsActivity"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
        "TotalLeadsActivity": totalLeadsActivity,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String id;
    DateTime date;
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
        date: DateTime.parse(json["date"]),
        staff: json["staff"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "date": date.toIso8601String(),
        "staff": staff,
        "description": description,
    };
}
