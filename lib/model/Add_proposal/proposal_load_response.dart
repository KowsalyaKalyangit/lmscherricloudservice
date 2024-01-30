// To parse this JSON data, do
//
//     final proposalLoadModel = proposalLoadModelFromJson(jsonString);

import 'dart:convert';

ProposalLoadModel proposalLoadModelFromJson(String str) => ProposalLoadModel.fromJson(json.decode(str));

String proposalLoadModelToJson(ProposalLoadModel data) => json.encode(data.toJson());

class ProposalLoadModel {
    int success;
    String status;
    String message;
    int totalLiftLoads;
    List<Datum> data;

    ProposalLoadModel({
        required this.success,
        required this.status,
        required this.message,
        required this.totalLiftLoads,
        required this.data,
    });

    factory ProposalLoadModel.fromJson(Map<String, dynamic> json) => ProposalLoadModel(
        success: json["success"],
        status: json["status"],
        message: json["message"],
        totalLiftLoads: json["TotalLiftLoads"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
        "TotalLiftLoads": totalLiftLoads,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String loadid;
    String optionname;

    Datum({
        required this.loadid,
        required this.optionname,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        loadid: json["loadid"],
        optionname: json["optionname"],
    );

    Map<String, dynamic> toJson() => {
        "loadid": loadid,
        "optionname": optionname,
    };
}
