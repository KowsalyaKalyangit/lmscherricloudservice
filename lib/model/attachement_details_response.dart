// To parse this JSON data, do
//
//     final attachmentDetailsModel = attachmentDetailsModelFromJson(jsonString);

import 'dart:convert';

AttachmentDetailsModel attachmentDetailsModelFromJson(String str) => AttachmentDetailsModel.fromJson(json.decode(str));

String attachmentDetailsModelToJson(AttachmentDetailsModel data) => json.encode(data.toJson());

class AttachmentDetailsModel {
    int success;
    String status;
    String message;
    List<Datum> data;

    AttachmentDetailsModel({
        required this.success,
        required this.status,
        required this.message,
        required this.data,
    });

    factory AttachmentDetailsModel.fromJson(Map<String, dynamic> json) => AttachmentDetailsModel(
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
    String fileName;
    String filetype;
    String download;

    Datum({
        required this.id,
        required this.fileName,
        required this.filetype,
        required this.download,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        fileName: json["file_name"],
        filetype: json["filetype"],
        download: json["download"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "file_name": fileName,
        "filetype": filetype,
        "download": download,
    };
}
