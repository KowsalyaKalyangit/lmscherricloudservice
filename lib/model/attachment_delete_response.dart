// To parse this JSON data, do
//
//     final attachmentDeleteModel = attachmentDeleteModelFromJson(jsonString);

import 'dart:convert';

AttachmentDeleteModel attachmentDeleteModelFromJson(String str) => AttachmentDeleteModel.fromJson(json.decode(str));

String attachmentDeleteModelToJson(AttachmentDeleteModel data) => json.encode(data.toJson());

class AttachmentDeleteModel {
    int success;
    String status;
    String message;
    List<Datum> data;

    AttachmentDeleteModel({
        required this.success,
        required this.status,
        required this.message,
        required this.data,
    });

    factory AttachmentDeleteModel.fromJson(Map<String, dynamic> json) => AttachmentDeleteModel(
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
