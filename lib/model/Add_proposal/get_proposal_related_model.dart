// To parse this JSON data, do
//
//     final getProposalRelatedModel = getProposalRelatedModelFromJson(jsonString);

import 'dart:convert';

GetProposalRelatedModel getProposalRelatedModelFromJson(String str) => GetProposalRelatedModel.fromJson(json.decode(str));

String getProposalRelatedModelToJson(GetProposalRelatedModel data) => json.encode(data.toJson());

class GetProposalRelatedModel {
    int success;
    String status;
    String message;
    List<Datum> data;

    GetProposalRelatedModel({
        required this.success,
        required this.status,
        required this.message,
        required this.data,
    });

    factory GetProposalRelatedModel.fromJson(Map<String, dynamic> json) => GetProposalRelatedModel(
        success: json["success"],
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String id;
    String name;
    String email;
    DateTime date;
    DateTime opentill;
    String to;
    String address;
    String city;
    String state;
    String country;
    String zip;
    String toemail;
    String phone;

    Datum({
        required this.id,
        required this.name,
        required this.email,
        required this.date,
        required this.opentill,
        required this.to,
        required this.address,
        required this.city,
        required this.state,
        required this.country,
        required this.zip,
        required this.toemail,
        required this.phone,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        date: DateTime.parse(json["date"]),
        opentill: DateTime.parse(json["opentill"]),
        to: json["to"],
        address: json["address"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        zip: json["zip"],
        toemail: json["toemail"],
        phone: json["phone"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "opentill": "${opentill.year.toString().padLeft(4, '0')}-${opentill.month.toString().padLeft(2, '0')}-${opentill.day.toString().padLeft(2, '0')}",
        "to": to,
        "address": address,
        "city": city,
        "state": state,
        "country": country,
        "zip": zip,
        "toemail": toemail,
        "phone": phone,
    };
}
