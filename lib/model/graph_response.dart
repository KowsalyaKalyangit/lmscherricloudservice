// To parse this JSON data, do
//
//     final graphModel = graphModelFromJson(jsonString);

import 'dart:convert';

GraphModel graphModelFromJson(String str) => GraphModel.fromJson(json.decode(str));

String graphModelToJson(GraphModel data) => json.encode(data.toJson());

class GraphModel {
    int success;
    String status;
    String message;
    List<List<Datum>> data;

    GraphModel({
        required this.success,
        required this.status,
        required this.message,
        required this.data,
    });

    factory GraphModel.fromJson(Map<String, dynamic> json) => GraphModel(
        success: json["success"],
        status: json["status"],
        message: json["message"],
        data: List<List<Datum>>.from(json["data"].map((x) => List<Datum>.from(x.map((x) => Datum.fromJson(x))))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
    };
}

class Datum {
    String name;
    String count;

    Datum({
        required this.name,
        required this.count,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"],
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "count": count,
    };
}
