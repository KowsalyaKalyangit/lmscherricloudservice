// To parse this JSON data, do
//
//     final proposalCreateModel = proposalCreateModelFromJson(jsonString);

import 'dart:convert';

ProposalCreateModel proposalCreateModelFromJson(String str) => ProposalCreateModel.fromJson(json.decode(str));

String proposalCreateModelToJson(ProposalCreateModel data) => json.encode(data.toJson());

class ProposalCreateModel {
    int success;
    String status;
    String message;
    List<Datum> data;

    ProposalCreateModel({
        required this.success,
        required this.status,
        required this.message,
        required this.data,
    });

    factory ProposalCreateModel.fromJson(Map<String, dynamic> json) => ProposalCreateModel(
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
    String proposalid;

    Datum({
        required this.proposalid,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        proposalid: json["proposalid"],
    );

    Map<String, dynamic> toJson() => {
        "proposalid": proposalid,
    };
}
