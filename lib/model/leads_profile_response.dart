// To parse this JSON data, do
//
//     final leadsProfileModel = leadsProfileModelFromJson(jsonString);

import 'dart:convert';

LeadsProfileModel leadsProfileModelFromJson(String str) => LeadsProfileModel.fromJson(json.decode(str));

String leadsProfileModelToJson(LeadsProfileModel data) => json.encode(data.toJson());

class LeadsProfileModel {
    int success;
    String status;
    String message;
    int totalLeads;
    List<Datum> data;

    LeadsProfileModel({
        required this.success,
        required this.status,
        required this.message,
        required this.totalLeads,
        required this.data,
    });

    factory LeadsProfileModel.fromJson(Map<String, dynamic> json) => LeadsProfileModel(
        success: json["success"]??'',
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
    String position;
    String email;
    String phonenumber;
    String customer;
    String leadValue;
    String description;
    String address;
    String city;
    String state;
    String country;
    String zip;
    String source;
    String status;

    Datum({
        required this.id,
        required this.name,
        required this.position,
        required this.email,
        required this.phonenumber,
        required this.customer,
        required this.leadValue,
        required this.description,
        required this.address,
        required this.city,
        required this.state,
        required this.country,
        required this.zip,
        required this.source,
        required this.status,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"]??'',
        name: json["name"]??'',
        position: json["position"]??'',
        email: json["email"]??'',
        phonenumber: json["phonenumber"]??'',
        customer: json["customer"]??"",
        leadValue: json["lead_value"]??'',
        description: json["description"]??'',
        address: json["address"]??'',
        city: json["city"]??'',
        state: json["state"]??'',
        country: json["country"]??'',
        zip: json["zip"]??'',
        source: json["source"]??'',
        status: json["status"]??'',
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "position": position,
        "email": email,
        "phonenumber": phonenumber,
        "customer": customer,
        "lead_value": leadValue,
        "description": description,
        "address": address,
        "city": city,
        "state": state,
        "country": country,
        "zip": zip,
        "source": source,
        "status": status,
    };
}
