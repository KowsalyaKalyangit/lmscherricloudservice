// To parse this JSON data, do
//
//     final addLeadsModel = addLeadsModelFromJson(jsonString);

import 'dart:convert';

AddLeadsModel addLeadsModelFromJson(String str) => AddLeadsModel.fromJson(json.decode(str));

String addLeadsModelToJson(AddLeadsModel data) => json.encode(data.toJson());

class AddLeadsModel {
    int success;
    String status;
    String message;
    List<Datum> data;

    AddLeadsModel({
        required this.success,
        required this.status,
        required this.message,
        required this.data,
    });

    factory AddLeadsModel.fromJson(Map<String, dynamic> json) => AddLeadsModel(
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
