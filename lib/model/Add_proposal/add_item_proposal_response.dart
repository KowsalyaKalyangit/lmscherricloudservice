// To parse this JSON data, do
//
//     final addItemProposalModel = addItemProposalModelFromJson(jsonString);

import 'dart:convert';

AddItemProposalModel addItemProposalModelFromJson(String str) => AddItemProposalModel.fromJson(json.decode(str));

String addItemProposalModelToJson(AddItemProposalModel data) => json.encode(data.toJson());

class AddItemProposalModel {
    int success;
    String status;
    String message;
    int totalLiftPrice;
    String from;
    List<Datum> data;

    AddItemProposalModel({
        required this.success,
        required this.status,
        required this.message,
        required this.totalLiftPrice,
        required this.from,
        required this.data,
    });

    factory AddItemProposalModel.fromJson(Map<String, dynamic> json) => AddItemProposalModel(
        success: json["success"],
        status: json["status"],
        message: json["message"],
        totalLiftPrice: json["TotalLiftPrice"],
        from: json["From"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
        "TotalLiftPrice": totalLiftPrice,
        "From": from,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String id;
    String optionname;

    Datum({
        required this.id,
        required this.optionname,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        optionname: json["optionname"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "optionname": optionname,
    };
}
