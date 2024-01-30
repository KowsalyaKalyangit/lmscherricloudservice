// To parse this JSON data, do
//
//     final attachmentUploadModel = attachmentUploadModelFromJson(jsonString);

import 'dart:convert';

AttachmentUploadModel attachmentUploadModelFromJson(String str) => AttachmentUploadModel.fromJson(json.decode(str));

String attachmentUploadModelToJson(AttachmentUploadModel data) => json.encode(data.toJson());

class AttachmentUploadModel {
    int success;
    String status;
    String message;
    List<Datum> data;

    AttachmentUploadModel({
        required this.success,
        required this.status,
        required this.message,
        required this.data,
    });

    factory AttachmentUploadModel.fromJson(Map<String, dynamic> json) => AttachmentUploadModel(
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
