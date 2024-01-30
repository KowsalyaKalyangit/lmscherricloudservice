// To parse this JSON data, do
//
//     final notesAddModel = notesAddModelFromJson(jsonString);

import 'dart:convert';

NotesAddModel notesAddModelFromJson(String str) => NotesAddModel.fromJson(json.decode(str));

String notesAddModelToJson(NotesAddModel data) => json.encode(data.toJson());

class NotesAddModel {
    int success;
    String status;
    String message;
    List<Datum> data;

    NotesAddModel({
        required this.success,
        required this.status,
        required this.message,
        required this.data,
    });

    factory NotesAddModel.fromJson(Map<String, dynamic> json) => NotesAddModel(
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
    String status;

    Datum({
        required this.status,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
    };
}
