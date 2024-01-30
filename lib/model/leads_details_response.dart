// To parse this JSON data, do
//
//     final leadsDetailsModel = leadsDetailsModelFromJson(jsonString);

import 'dart:convert';

LeadsDetailsModel leadsDetailsModelFromJson(String str) => LeadsDetailsModel.fromJson(json.decode(str));

String leadsDetailsModelToJson(LeadsDetailsModel data) => json.encode(data.toJson());

class LeadsDetailsModel {
    int success;
    String status;
    String message;
    int totalLeads;
    List<Datum> data;

    LeadsDetailsModel({
        required this.success,
        required this.status,
        required this.message,
        required this.totalLeads,
        required this.data,
    });

    factory LeadsDetailsModel.fromJson(Map<String, dynamic> json) => LeadsDetailsModel(
        success: json["success"],
        status: json["status"],
        message: json["message"],
        totalLeads: json["TotalLeads"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
        "TotalLeads": totalLeads,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String id;
    String name;
    String email;
    String phonenumber;
    String customer;
    String status;

    Datum({
        required this.id,
        required this.name,
        required this.email,
        required this.phonenumber,
        required this.customer,
        required this.status,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phonenumber: json["phonenumber"],
        customer: json["customer"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phonenumber": phonenumber,
        "customer": customer,
        "status": status,
    };
}
