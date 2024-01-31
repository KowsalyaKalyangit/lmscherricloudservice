// To parse this JSON data, do
//
//     final leadsSourceModel = leadsSourceModelFromJson(jsonString);

import 'dart:convert';

LeadsSourceModel leadsSourceModelFromJson(String str) => LeadsSourceModel.fromJson(json.decode(str));

String leadsSourceModelToJson(LeadsSourceModel data) => json.encode(data.toJson());

class LeadsSourceModel {
    int success;
    String status;
    String message;
    int totalSource;
    List<Datum> data;

    LeadsSourceModel({
        required this.success,
        required this.status,
        required this.message,
        required this.totalSource,
        required this.data,
    });

    factory LeadsSourceModel.fromJson(Map<String, dynamic> json) => LeadsSourceModel(
        success: json["success"],
        status: json["status"],
        message: json["message"],
        totalSource: json["TotalSource"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
        "TotalSource": totalSource,
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
        id: json["id"]??"",
        name: json["name"]??'',
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
