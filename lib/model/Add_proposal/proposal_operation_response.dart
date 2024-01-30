// To parse this JSON data, do
//
//     final proposalOperationModel = proposalOperationModelFromJson(jsonString);

import 'dart:convert';

ProposalOperationModel proposalOperationModelFromJson(String str) => ProposalOperationModel.fromJson(json.decode(str));

String proposalOperationModelToJson(ProposalOperationModel data) => json.encode(data.toJson());

class ProposalOperationModel {
    int success;
    String status;
    String message;
    int totalLiftOperation;
    List<Datum> data;

    ProposalOperationModel({
        required this.success,
        required this.status,
        required this.message,
        required this.totalLiftOperation,
        required this.data,
    });

    factory ProposalOperationModel.fromJson(Map<String, dynamic> json) => ProposalOperationModel(
        success: json["success"],
        status: json["status"],
        message: json["message"],
        totalLiftOperation: json["TotalLiftOperation"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
        "TotalLiftOperation": totalLiftOperation,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String operationid;
    String name;

    Datum({
        required this.operationid,
        required this.name,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        operationid: json["operationid"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "operationid": operationid,
        "name": name,
    };
}
