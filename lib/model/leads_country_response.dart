// To parse this JSON data, do
//
//     final leadsCountryModel = leadsCountryModelFromJson(jsonString);

import 'dart:convert';

LeadsCountryModel leadsCountryModelFromJson(String str) => LeadsCountryModel.fromJson(json.decode(str));

String leadsCountryModelToJson(LeadsCountryModel data) => json.encode(data.toJson());

class LeadsCountryModel {
    int success;
    String status;
    String message;
    int totalCountry;
    List<Datum> data;

    LeadsCountryModel({
        required this.success,
        required this.status,
        required this.message,
        required this.totalCountry,
        required this.data,
    });

    factory LeadsCountryModel.fromJson(Map<String, dynamic> json) => LeadsCountryModel(
        success: json["success"],
        status: json["status"],
        message: json["message"],
        totalCountry: json["TotalCountry"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
        "TotalCountry": totalCountry,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String countryId;
    String countryName;

    Datum({
        required this.countryId,
        required this.countryName,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        countryId: json["country_id"]??'',
        countryName: json["country_name"]??'',
    );

    Map<String, dynamic> toJson() => {
        "country_id": countryId,
        "country_name": countryName,
    };
}
