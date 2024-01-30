// To parse this JSON data, do
//
//     final dashboardCategoryModel = dashboardCategoryModelFromJson(jsonString);

import 'dart:convert';

DashboardCategoryModel dashboardCategoryModelFromJson(String str) => DashboardCategoryModel.fromJson(json.decode(str));

String dashboardCategoryModelToJson(DashboardCategoryModel data) => json.encode(data.toJson());

class DashboardCategoryModel {
    int success;
    String status;
    String message;
    int totalLeads;
    List<Datum> data;

    DashboardCategoryModel({
        required this.success,
        required this.status,
        required this.message,
        required this.totalLeads,
        required this.data,
    });

    factory DashboardCategoryModel.fromJson(Map<String, dynamic> json) => DashboardCategoryModel(
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
    String company;

    Datum({
        required this.id,
        required this.name,
        required this.email,
        required this.phonenumber,
        required this.company,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phonenumber: json["phonenumber"],
        company: json["company"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phonenumber": phonenumber,
        "company": company,
    };
}
