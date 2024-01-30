// To parse this JSON data, do
//
//     final proposalOpenModel = proposalOpenModelFromJson(jsonString);

import 'dart:convert';

ProposalOpenModel proposalOpenModelFromJson(String str) => ProposalOpenModel.fromJson(json.decode(str));

String proposalOpenModelToJson(ProposalOpenModel data) => json.encode(data.toJson());

class ProposalOpenModel {
    int success;
    String status;
    String message;
    int totalLiftOpen;
    List<Datum> data;

    ProposalOpenModel({
        required this.success,
        required this.status,
        required this.message,
        required this.totalLiftOpen,
        required this.data,
    });

    factory ProposalOpenModel.fromJson(Map<String, dynamic> json) => ProposalOpenModel(
        success: json["success"],
        status: json["status"],
        message: json["message"],
        totalLiftOpen: json["TotalLiftOpen"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
        "TotalLiftOpen": totalLiftOpen,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String openingid;
    String name;

    Datum({
        required this.openingid,
        required this.name,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        openingid: json["openingid"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "openingid": openingid,
        "name": name,
    };
}
