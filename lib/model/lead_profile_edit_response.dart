// To parse this JSON data, do
//
//     final leadsProfileEditModel = leadsProfileEditModelFromJson(jsonString);

import 'dart:convert';

LeadsProfileEditModel leadsProfileEditModelFromJson(String str) => LeadsProfileEditModel.fromJson(json.decode(str));

String leadsProfileEditModelToJson(LeadsProfileEditModel data) => json.encode(data.toJson());

class LeadsProfileEditModel {
    int success;
    String status;
    String message;
    List<Datum> data;

    LeadsProfileEditModel({
        required this.success,
        required this.status,
        required this.message,
        required this.data,
    });

    factory LeadsProfileEditModel.fromJson(Map<String, dynamic> json) => LeadsProfileEditModel(
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
    String update;

    Datum({
        required this.update,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        update: json["update"],
    );

    Map<String, dynamic> toJson() => {
        "update": update,
    };
}
