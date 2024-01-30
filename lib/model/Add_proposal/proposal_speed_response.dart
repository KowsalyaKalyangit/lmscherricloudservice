// To parse this JSON data, do
//
//     final proposalSpeedModel = proposalSpeedModelFromJson(jsonString);

import 'dart:convert';

ProposalSpeedModel proposalSpeedModelFromJson(String str) => ProposalSpeedModel.fromJson(json.decode(str));

String proposalSpeedModelToJson(ProposalSpeedModel data) => json.encode(data.toJson());

class ProposalSpeedModel {
    int success;
    String status;
    String message;
    int totalLiftSpeed;
    String from;
    List<Datum> data;

    ProposalSpeedModel({
        required this.success,
        required this.status,
        required this.message,
        required this.totalLiftSpeed,
        required this.from,
        required this.data,
    });

    factory ProposalSpeedModel.fromJson(Map<String, dynamic> json) => ProposalSpeedModel(
        success: json["success"]??'',
        status: json["status"]??'',
        message: json["message"]??'',
        totalLiftSpeed: json["TotalLiftSpeed"]??'',
        from: json["From"]??'',
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
        "TotalLiftSpeed": totalLiftSpeed,
        "From": from,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String speedid;
    String name;

    Datum({
        required this.speedid,
        required this.name,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        speedid: json["speedid"]??'',
        name: json["name"]??'',
    );

    Map<String, dynamic> toJson() => {
        "speedid": speedid,
        "name": name,
    };
}
