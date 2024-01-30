// To parse this JSON data, do
//
//     final proposalStopModel = proposalStopModelFromJson(jsonString);

import 'dart:convert';

ProposalStopModel proposalStopModelFromJson(String str) => ProposalStopModel.fromJson(json.decode(str));

String proposalStopModelToJson(ProposalStopModel data) => json.encode(data.toJson());

class ProposalStopModel {
    int success;
    String status;
    String message;
    int totalLiftStop;
    List<Datum> data;

    ProposalStopModel({
        required this.success,
        required this.status,
        required this.message,
        required this.totalLiftStop,
        required this.data,
    });

    factory ProposalStopModel.fromJson(Map<String, dynamic> json) => ProposalStopModel(
        success: json["success"],
        status: json["status"],
        message: json["message"],
        totalLiftStop: json["TotalLiftStop"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
        "TotalLiftStop": totalLiftStop,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String stopid;
    String name;

    Datum({
        required this.stopid,
        required this.name,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        stopid: json["stopid"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "stopid": stopid,
        "name": name,
    };
}
