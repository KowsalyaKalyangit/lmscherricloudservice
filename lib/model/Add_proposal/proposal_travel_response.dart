// To parse this JSON data, do
//
//     final proposalTravelModel = proposalTravelModelFromJson(jsonString);

import 'dart:convert';

ProposalTravelModel proposalTravelModelFromJson(String str) => ProposalTravelModel.fromJson(json.decode(str));

String proposalTravelModelToJson(ProposalTravelModel data) => json.encode(data.toJson());

class ProposalTravelModel {
    int success;
    String status;
    String message;
    int totalLiftTravel;
    List<Datum> data;

    ProposalTravelModel({
        required this.success,
        required this.status,
        required this.message,
        required this.totalLiftTravel,
        required this.data,
    });

    factory ProposalTravelModel.fromJson(Map<String, dynamic> json) => ProposalTravelModel(
        success: json["success"],
        status: json["status"],
        message: json["message"],
        totalLiftTravel: json["TotalLiftTravel"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
        "TotalLiftTravel": totalLiftTravel,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String travelid;
    String name;

    Datum({
        required this.travelid,
        required this.name,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        travelid: json["travelid"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "travelid": travelid,
        "name": name,
    };
}
