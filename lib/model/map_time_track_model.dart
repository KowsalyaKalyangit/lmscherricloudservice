// To parse this JSON data, do
//
//     final mapTrackTimeModel = mapTrackTimeModelFromJson(jsonString);

import 'dart:convert';

MapTrackTimeModel mapTrackTimeModelFromJson(String str) => MapTrackTimeModel.fromJson(json.decode(str));

String mapTrackTimeModelToJson(MapTrackTimeModel data) => json.encode(data.toJson());

class MapTrackTimeModel {
    int success;
    String status;
    String message;
    List<Datum> data;

    MapTrackTimeModel({
        required this.success,
        required this.status,
        required this.message,
        required this.data,
    });

    factory MapTrackTimeModel.fromJson(Map<String, dynamic> json) => MapTrackTimeModel(
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
    Destination starting;
    Destination destination;

    Datum({
        required this.starting,
        required this.destination,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        starting: Destination.fromJson(json["starting"]),
        destination: Destination.fromJson(json["destination"]),
    );

    Map<String, dynamic> toJson() => {
        "starting": starting.toJson(),
        "destination": destination.toJson(),
    };
}

class Destination {
    String flag;
    String date;
    String time;

    Destination({
        required this.flag,
        required this.date,
        required this.time,
    });

    factory Destination.fromJson(Map<String, dynamic> json) => Destination(
        flag: json["flag"]??'',
        date:  json["date"]??"",
        time: json["time"]??'',
    );

    Map<String, dynamic> toJson() => {
        "flag": flag,
        "date":date,
        "time": time,
    };
}
