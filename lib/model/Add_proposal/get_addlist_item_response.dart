// To parse this JSON data, do
//
//     final getAddListItemModel = getAddListItemModelFromJson(jsonString);

import 'dart:convert';

GetAddListItemModel getAddListItemModelFromJson(String str) => GetAddListItemModel.fromJson(json.decode(str));

String getAddListItemModelToJson(GetAddListItemModel data) => json.encode(data.toJson());

class GetAddListItemModel {
    int success;
    String status;
    String message;
    int totalLiftPrice;
    String from;
    List<Datum> data;

    GetAddListItemModel({
        required this.success,
        required this.status,
        required this.message,
        required this.totalLiftPrice,
        required this.from,
        required this.data,
    });

    factory GetAddListItemModel.fromJson(Map<String, dynamic> json) => GetAddListItemModel(
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
    String subtotal;
    String total;
    String typeid;
    String specificationid;
    String floorid;
    String typename;
    String floornname;
    String passenger;
    String specificationname;
    String carEnclosure;
    String hoistwayDoors;
    String entrances;
    String doorOperation;
    String powerSupply;

    Datum({
        required this.id,
        required this.subtotal,
        required this.total,
        required this.typeid,
        required this.specificationid,
        required this.floorid,
        required this.typename,
        required this.floornname,
        required this.passenger,
        required this.specificationname,
        required this.carEnclosure,
        required this.hoistwayDoors,
        required this.entrances,
        required this.doorOperation,
        required this.powerSupply,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        subtotal: json["subtotal"],
        total: json["total"],
        typeid: json["typeid"],
        specificationid: json["specificationid"],
        floorid: json["floorid"],
        typename: json["typename"],
        floornname: json["floornname"],
        passenger: json["passenger"],
        specificationname: json["specificationname"],
        carEnclosure: json["car_enclosure"],
        hoistwayDoors: json["hoistway_doors"],
        entrances: json["entrances"],
        doorOperation: json["door_operation"],
        powerSupply: json["power_supply"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "subtotal": subtotal,
        "total": total,
        "typeid": typeid,
        "specificationid": specificationid,
        "floorid": floorid,
        "typename": typename,
        "floornname": floornname,
        "passenger": passenger,
        "specificationname": specificationname,
        "car_enclosure": carEnclosure,
        "hoistway_doors": hoistwayDoors,
        "entrances": entrances,
        "door_operation": doorOperation,
        "power_supply": powerSupply,
    };
}
