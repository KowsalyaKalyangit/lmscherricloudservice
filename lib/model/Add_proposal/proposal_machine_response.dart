// To parse this JSON data, do
//
//     final proposalMachineModel = proposalMachineModelFromJson(jsonString);

import 'dart:convert';

ProposalMachineModel proposalMachineModelFromJson(String str) => ProposalMachineModel.fromJson(json.decode(str));

String proposalMachineModelToJson(ProposalMachineModel data) => json.encode(data.toJson());

class ProposalMachineModel {
    int success;
    String status;
    String message;
    int totalLiftMachine;
    List<Datum> data;

    ProposalMachineModel({
        required this.success,
        required this.status,
        required this.message,
        required this.totalLiftMachine,
        required this.data,
    });

    factory ProposalMachineModel.fromJson(Map<String, dynamic> json) => ProposalMachineModel(
        success: json["success"],
        status: json["status"],
        message: json["message"],
        totalLiftMachine: json["TotalLiftMachine"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
        "TotalLiftMachine": totalLiftMachine,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String machineid;
    String name;

    Datum({
        required this.machineid,
        required this.name,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        machineid: json["machineid"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "machineid": machineid,
        "name": name,
    };
}
