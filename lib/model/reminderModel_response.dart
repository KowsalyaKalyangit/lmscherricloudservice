// To parse this JSON data, do
//
//     final reminderModel = reminderModelFromJson(jsonString);

import 'dart:convert';

ReminderModel reminderModelFromJson(String str) => ReminderModel.fromJson(json.decode(str));

String reminderModelToJson(ReminderModel data) => json.encode(data.toJson());

class ReminderModel {
    int success;
    String status;
    String message;
    List<Datum> data;

    ReminderModel({
        required this.success,
        required this.status,
        required this.message,
        required this.data,
    });

    factory ReminderModel.fromJson(Map<String, dynamic> json) => ReminderModel(
        success: json["success"],
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String id;
    String description;
    DateTime date;
    String isnotified;
    String remindby;
    String profileimg;

    Datum({
        required this.id,
        required this.description,
        required this.date,
        required this.isnotified,
        required this.remindby,
        required this.profileimg,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        description: json["description"],
        date: DateTime.parse(json["date"]),
        isnotified: json["isnotified"],
        remindby: json["remindby"],
        profileimg: json["profileimg"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "date": date.toIso8601String(),
        "isnotified": isnotified,
        "remindby": remindby,
        "profileimg": profileimg,
    };
}
