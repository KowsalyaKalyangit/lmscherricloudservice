// To parse this JSON data, do
//
//     final proposalLoadAmtModel = proposalLoadAmtModelFromJson(jsonString);

import 'dart:convert';

ProposalLoadAmtModel proposalLoadAmtModelFromJson(String str) => ProposalLoadAmtModel.fromJson(json.decode(str));

String proposalLoadAmtModelToJson(ProposalLoadAmtModel data) => json.encode(data.toJson());

class ProposalLoadAmtModel {
    int success;
    String status;
    String message;
    int totalCount;
    String from;
    List<Datum> data;

    ProposalLoadAmtModel({
        required this.success,
        required this.status,
        required this.message,
        required this.totalCount,
        required this.from,
        required this.data,
    });

    factory ProposalLoadAmtModel.fromJson(Map<String, dynamic> json) => ProposalLoadAmtModel(
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
    String loadid;
    int subtotal;
    int total;

    Datum({
        required this.loadid,
        required this.subtotal,
        required this.total,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        loadid: json["loadid"],
        subtotal: json["subtotal"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "loadid": loadid,
        "subtotal": subtotal,
        "total": total,
    };
}
