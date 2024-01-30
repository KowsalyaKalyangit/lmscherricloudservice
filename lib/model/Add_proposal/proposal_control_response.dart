// To parse this JSON data, do
//
//     final proposalControlModel = proposalControlModelFromJson(jsonString);

import 'dart:convert';

ProposalControlModel proposalControlModelFromJson(String str) => ProposalControlModel.fromJson(json.decode(str));

String proposalControlModelToJson(ProposalControlModel data) => json.encode(data.toJson());

class ProposalControlModel {
    int success;
    String status;
    String message;
    int totalLiftControl;
    List<Datum> data;

    ProposalControlModel({
        required this.success,
        required this.status,
        required this.message,
        required this.totalLiftControl,
        required this.data,
    });

    factory ProposalControlModel.fromJson(Map<String, dynamic> json) => ProposalControlModel(
        success: json["success"],
        status: json["status"],
        message: json["message"],
        totalLiftControl: json["TotalLiftControl"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
        "TotalLiftControl": totalLiftControl,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String controlid;
    String name;

    Datum({
        required this.controlid,
        required this.name,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        controlid: json["controlid"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "controlid": controlid,
        "name": name,
    };
}
