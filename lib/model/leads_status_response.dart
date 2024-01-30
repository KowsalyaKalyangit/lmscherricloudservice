// To parse this JSON data, do
//
//     final leadsStatusModel = leadsStatusModelFromJson(jsonString);

import 'dart:convert';

LeadsStatusModel leadsStatusModelFromJson(String str) => LeadsStatusModel.fromJson(json.decode(str));

String leadsStatusModelToJson(LeadsStatusModel data) => json.encode(data.toJson());

class LeadsStatusModel {
    int success;
    String status;
    String message;
    int totalStatus;
    List<Datum> data;

    LeadsStatusModel({
        required this.success,
        required this.status,
        required this.message,
        required this.totalStatus,
        required this.data,
    });

    factory LeadsStatusModel.fromJson(Map<String, dynamic> json) => LeadsStatusModel(
        success: json["success"],
        status: json["status"],
        message: json["message"],
        totalStatus: json["TotalStatus"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
        "TotalStatus": totalStatus,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String id;
    String name;

    Datum({
        required this.id,
        required this.name,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
