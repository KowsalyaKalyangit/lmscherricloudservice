// To parse this JSON data, do
//
//     final mapTrackModel = mapTrackModelFromJson(jsonString);

import 'dart:convert';

MapTrackModel mapTrackModelFromJson(String str) => MapTrackModel.fromJson(json.decode(str));

String mapTrackModelToJson(MapTrackModel data) => json.encode(data.toJson());

class MapTrackModel {
    int success;
    String ?status;
    String message;
    String ? totalCountry;
    List<Datum> data;

    MapTrackModel({
        required this.success,
        required this.status,
        required this.message,
        required this.totalCountry,
        required this.data,
    });

    factory MapTrackModel.fromJson(Map<String, dynamic> json) => MapTrackModel(
        success: json["success"],
        status: json["status"],
        message: json["message"],
        totalCountry: json["TotalCountry"]??'',
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
        "TotalCountry": totalCountry,
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
