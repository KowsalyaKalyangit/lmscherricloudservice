// To parse this JSON data, do
//
//     final proposalGetModel = proposalGetModelFromJson(jsonString);

import 'dart:convert';

ProposalGetModel proposalGetModelFromJson(String str) => ProposalGetModel.fromJson(json.decode(str));

String proposalGetModelToJson(ProposalGetModel data) => json.encode(data.toJson());

class ProposalGetModel {
    int success;
    String status;
    String message;
    int totalProposal;
    List<Datum> data;

    ProposalGetModel({
        required this.success,
        required this.status,
        required this.message,
        required this.totalProposal,
        required this.data,
    });

    factory ProposalGetModel.fromJson(Map<String, dynamic> json) => ProposalGetModel(
        success: json["success"],
        status: json["status"],
        message: json["message"],
        totalProposal: json["TotalProposal"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
        "TotalProposal": totalProposal,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String proposalid;
    String number;
    String subject;
    String total;
    String date;
    String opentill;
    String datecreated;
    String status;
    String edit;
    String viewlink;

    Datum({
        required this.proposalid,
        required this.number,
        required this.subject,
        required this.total,
        required this.date,
        required this.opentill,
        required this.datecreated,
        required this.status,
        required this.edit,
        required this.viewlink,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        proposalid: json["proposalid"],
        number: json["number"],
        subject: json["subject"],
        total: json["total"],
        date:  json["date"],
        opentill: json["opentill"],
        datecreated:  json["datecreated"],
        status: json["status"],
        edit: json["edit"],
        viewlink: json["viewlink"],
    );

    Map<String, dynamic> toJson() => {
        "proposalid": proposalid,
        "number": number,
        "subject": subject,
        "total": total,
        "date": date,
        "opentill":opentill,
        "datecreated": datecreated,
        "status": status,
        "edit": edit,
        "viewlink": viewlink,
    };
}
