// To parse this JSON data, do
//
//     final proposalSpeedAmountModel = proposalSpeedAmountModelFromJson(jsonString);

import 'dart:convert';

ProposalSpeedAmountModel proposalSpeedAmountModelFromJson(String str) => ProposalSpeedAmountModel.fromJson(json.decode(str));

String proposalSpeedAmountModelToJson(ProposalSpeedAmountModel data) => json.encode(data.toJson());

class ProposalSpeedAmountModel {
    int success;
    String status;
    String message;
    int totalCount;
    String from;
    List<Datum> data;

    ProposalSpeedAmountModel({
        required this.success,
        required this.status,
        required this.message,
        required this.totalCount,
        required this.from,
        required this.data,
    });

    factory ProposalSpeedAmountModel.fromJson(Map<String, dynamic> json) => ProposalSpeedAmountModel(
        success: json["success"],
        status: json["status"],
        message: json["message"],
        totalCount: json["TotalCount"],
        from: json["From"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
        "TotalCount": totalCount,
        "From": from,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String speedid;
    int subtotal;
    int total;

    Datum({
        required this.speedid,
        required this.subtotal,
        required this.total,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        speedid: json["speedid"],
        subtotal: json["subtotal"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "speedid": speedid,
        "subtotal": subtotal,
        "total": total,
    };
}
