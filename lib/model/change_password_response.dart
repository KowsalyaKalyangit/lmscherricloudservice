// To parse this JSON data, do
//
//     final changePasswordModel = changePasswordModelFromJson(jsonString);

import 'dart:convert';

ChangePasswordModel changePasswordModelFromJson(String str) => ChangePasswordModel.fromJson(json.decode(str));

String changePasswordModelToJson(ChangePasswordModel data) => json.encode(data.toJson());

class ChangePasswordModel {
    int success;
    String status;
    String message;
    List<dynamic> data;

    ChangePasswordModel({
        required this.success,
        required this.status,
        required this.message,
        required this.data,
    });

    factory ChangePasswordModel.fromJson(Map<String, dynamic> json) => ChangePasswordModel(
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
