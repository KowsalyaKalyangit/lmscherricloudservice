// To parse this JSON data, do
//
//     final proposalTravelAmtModel = proposalTravelAmtModelFromJson(jsonString);

import 'dart:convert';

ProposalTravelAmtModel proposalTravelAmtModelFromJson(String str) => ProposalTravelAmtModel.fromJson(json.decode(str));

String proposalTravelAmtModelToJson(ProposalTravelAmtModel data) => json.encode(data.toJson());

class ProposalTravelAmtModel {
    int success;
    String status;
    String message;
    int totalCount;
    String from;
    List<Datum> data;

    ProposalTravelAmtModel({
        required this.success,
        required this.status,
        required this.message,
        required this.totalCount,
        required this.from,
        required this.data,
    });

    factory ProposalTravelAmtModel.fromJson(Map<String, dynamic> json) => ProposalTravelAmtModel(
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
    String travelid;
    int stop;
    int opening;
    int subtotal;
    int total;

    Datum({
        required this.travelid,
        required this.stop,
        required this.opening,
        required this.subtotal,
        required this.total,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        travelid: json["travelid"],
        stop: json["stop"],
        opening: json["opening"],
        subtotal: json["subtotal"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "travelid": travelid,
        "stop": stop,
        "opening": opening,
        "subtotal": subtotal,
        "total": total,
    };
}
