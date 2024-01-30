// To parse this JSON data, do
//
//     final proposalCurrencyModel = proposalCurrencyModelFromJson(jsonString);

import 'dart:convert';

ProposalCurrencyModel proposalCurrencyModelFromJson(String str) => ProposalCurrencyModel.fromJson(json.decode(str));

String proposalCurrencyModelToJson(ProposalCurrencyModel data) => json.encode(data.toJson());

class ProposalCurrencyModel {
    int success;
    String status;
    String message;
    int total;
    List<Datum> data;

    ProposalCurrencyModel({
        required this.success,
        required this.status,
        required this.message,
        required this.total,
        required this.data,
    });

    factory ProposalCurrencyModel.fromJson(Map<String, dynamic> json) => ProposalCurrencyModel(
        success: json["success"],
        status: json["status"],
        message: json["message"],
        total: json["Total"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
        "Total": total,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String id;
    String symbol;
    String name;

    Datum({
        required this.id,
        required this.symbol,
        required this.name,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        symbol: json["symbol"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "symbol": symbol,
        "name": name,
    };
}
