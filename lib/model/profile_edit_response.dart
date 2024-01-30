// To parse this JSON data, do
//
//     final profilEditModel = profilEditModelFromJson(jsonString);

import 'dart:convert';

ProfilEditModel profilEditModelFromJson(String str) => ProfilEditModel.fromJson(json.decode(str));

String profilEditModelToJson(ProfilEditModel data) => json.encode(data.toJson());

class ProfilEditModel {
    int success;
    String status;
    String message;
    List<dynamic> data;

    ProfilEditModel({
        required this.success,
        required this.status,
        required this.message,
        required this.data,
    });

    factory ProfilEditModel.fromJson(Map<String, dynamic> json) => ProfilEditModel(
        success: json["success"],
        status: json["status"],
        message: json["message"],
        data: List<dynamic>.from(json["data"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x)),
    };
}
