// To parse this JSON data, do
//
//     final proposalLeadTypeModel = proposalLeadTypeModelFromJson(jsonString);

import 'dart:convert';

ProposalLeadTypeModel proposalLeadTypeModelFromJson(String str) => ProposalLeadTypeModel.fromJson(json.decode(str));

String proposalLeadTypeModelToJson(ProposalLeadTypeModel data) => json.encode(data.toJson());

class ProposalLeadTypeModel {
    int success;
    String status;
    String message;
    int total;
    List<Datum> data;

    ProposalLeadTypeModel({
        required this.success,
        required this.status,
        required this.message,
        required this.total,
        required this.data,
    });

    factory ProposalLeadTypeModel.fromJson(Map<String, dynamic> json) => ProposalLeadTypeModel(
        success: json["success"],
        status: json["status"],
        message: json["message"],
        total: json["Total"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
        "Total": total,
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
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
