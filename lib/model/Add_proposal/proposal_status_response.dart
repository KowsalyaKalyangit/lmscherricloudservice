// To parse this JSON data, do
//
//     final proposalStatusModel = proposalStatusModelFromJson(jsonString);

import 'dart:convert';

ProposalStatusModel proposalStatusModelFromJson(String str) => ProposalStatusModel.fromJson(json.decode(str));

String proposalStatusModelToJson(ProposalStatusModel data) => json.encode(data.toJson());

class ProposalStatusModel {
    int success;
    String status;
    String message;
    List<Datum> data;

    ProposalStatusModel({
        required this.success,
        required this.status,
        required this.message,
        required this.data,
    });

    factory ProposalStatusModel.fromJson(Map<String, dynamic> json) => ProposalStatusModel(
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
    String name;
    String value;

    Datum({
        required this.name,
        required this.value,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
    };
}
