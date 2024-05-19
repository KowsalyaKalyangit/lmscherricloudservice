// To parse this JSON data, do
//
//     final mapStartStopModel = mapStartStopModelFromJson(jsonString);

import 'dart:convert';

MapStartStopModel mapStartStopModelFromJson(String str) => MapStartStopModel.fromJson(json.decode(str));

String mapStartStopModelToJson(MapStartStopModel data) => json.encode(data.toJson());

class MapStartStopModel {
    int success;
    String status;
    String message;
    List<Datum> data;

    MapStartStopModel({
        required this.success,
        required this.status,
        required this.message,
        required this.data,
    });

    factory MapStartStopModel.fromJson(Map<String, dynamic> json) => MapStartStopModel(
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
    String trackstatus;

    Datum({
        required this.trackstatus,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        trackstatus: json["trackstatus"],
    );

    Map<String, dynamic> toJson() => {
        "trackstatus": trackstatus,
    };
}
