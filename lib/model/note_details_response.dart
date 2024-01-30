// To parse this JSON data, do
//
//     final notesDetailsModel = notesDetailsModelFromJson(jsonString);

import 'dart:convert';

NotesDetailsModel notesDetailsModelFromJson(String str) => NotesDetailsModel.fromJson(json.decode(str));

String notesDetailsModelToJson(NotesDetailsModel data) => json.encode(data.toJson());

class NotesDetailsModel {
    int success;
    String status;
    String message;
    List<Datum> data;

    NotesDetailsModel({
        required this.success,
        required this.status,
        required this.message,
        required this.data,
    });

    factory NotesDetailsModel.fromJson(Map<String, dynamic> json) => NotesDetailsModel(
        success: json["success"]??"",
        status: json["status"]??'',
        message: json["message"]??'',
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
    dynamic description;
    String dateContacted;
    DateTime dateadded;
    String filename;
    String addedby;

    Datum({
        required this.id,
        required this.description,
        required this.dateContacted,
        required this.dateadded,
        required this.filename,
        required this.addedby,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        description: json["description"],
        dateContacted: json["date_contacted"],
        dateadded: DateTime.parse(json["dateadded"]),
        filename: json["filename"],
        addedby: json["addedby"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "date_contacted": dateContacted,
        "dateadded": dateadded.toIso8601String(),
        "filename": filename,
        "addedby": addedby,
    };
}
