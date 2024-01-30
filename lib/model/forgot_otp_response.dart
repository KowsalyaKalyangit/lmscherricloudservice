// To parse this JSON data, do
//
//     final forgotOtpModel = forgotOtpModelFromJson(jsonString);

import 'dart:convert';

ForgotOtpModel forgotOtpModelFromJson(String str) => ForgotOtpModel.fromJson(json.decode(str));

String forgotOtpModelToJson(ForgotOtpModel data) => json.encode(data.toJson());

class ForgotOtpModel {
    int success;
    String status;
    String message;
    List<dynamic> data;

    ForgotOtpModel({
        required this.success,
        required this.status,
        required this.message,
        required this.data,
    });

    factory ForgotOtpModel.fromJson(Map<String, dynamic> json) => ForgotOtpModel(
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
