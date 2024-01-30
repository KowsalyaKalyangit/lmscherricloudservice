// To parse this JSON data, do
//
//     final proposalOpersationAmtModel = proposalOpersationAmtModelFromJson(jsonString);

import 'dart:convert';

ProposalOpersationAmtModel proposalOpersationAmtModelFromJson(String str) => ProposalOpersationAmtModel.fromJson(json.decode(str));

String proposalOpersationAmtModelToJson(ProposalOpersationAmtModel data) => json.encode(data.toJson());

class ProposalOpersationAmtModel {
    int success;
    String status;
    String message;
    int totalCount;
    String from;
    List<Datum> data;

    ProposalOpersationAmtModel({
        required this.success,
        required this.status,
        required this.message,
        required this.totalCount,
        required this.from,
        required this.data,
    });

    factory ProposalOpersationAmtModel.fromJson(Map<String, dynamic> json) => ProposalOpersationAmtModel(
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
    String operationid;
    int subtotal;
    int total;

    Datum({
        required this.operationid,
        required this.subtotal,
        required this.total,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        operationid: json["operationid"],
        subtotal: json["subtotal"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "operationid": operationid,
        "subtotal": subtotal,
        "total": total,
    };
}
