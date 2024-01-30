// To parse this JSON data, do
//
//     final proposalEditModel = proposalEditModelFromJson(jsonString);

import 'dart:convert';

ProposalEditModel proposalEditModelFromJson(String str) => ProposalEditModel.fromJson(json.decode(str));

String proposalEditModelToJson(ProposalEditModel data) => json.encode(data.toJson());

class ProposalEditModel {
    int success;
    String status;
    String message;
    List<Datum> data;

    ProposalEditModel({
        required this.success,
        required this.status,
        required this.message,
        required this.data,
    });

    factory ProposalEditModel.fromJson(Map<String, dynamic> json) => ProposalEditModel(
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
    String proposalid;
    String subject;
    String related;
    String lead;
    DateTime date;
    DateTime openTill;
    String currencyid;
    String currency;
    String symbol;
    String discountType;
    String statusid;
    String status;
    String assignedid;
    String assign;
    String to;
    String address;
    String city;
    String state;
    String country;
    String zip;
    String toemail;
    String phone;
    String liftpriceid;
    String typeid;
    String type;
    String floorid;
    String floor;
    String specificationid;
    String specification;
    String passenger;
    String loadid;
    String load;
    String speedid;
    String speed;
    String travelid;
    String travel;
    String stopid;
    String stop;
    String openingid;
    String opening;
    String controlid;
    String control;
    String operationid;
    String operation;
    String machineid;
    String machine;
    String hoistwaysize;
    String carsize;
    String carenclosure;
    String hoistwaydoors;
    String entrances;
    String dooroperation;
    String delivery;
    String erection;
    String powerSupply;
    String subtotal;
    String total;

    Datum({
        required this.proposalid,
        required this.subject,
        required this.related,
        required this.lead,
        required this.date,
        required this.openTill,
        required this.currencyid,
        required this.currency,
        required this.symbol,
        required this.discountType,
        required this.statusid,
        required this.status,
        required this.assignedid,
        required this.assign,
        required this.to,
        required this.address,
        required this.city,
        required this.state,
        required this.country,
        required this.zip,
        required this.toemail,
        required this.phone,
        required this.liftpriceid,
        required this.typeid,
        required this.type,
        required this.floorid,
        required this.floor,
        required this.specificationid,
        required this.specification,
        required this.passenger,
        required this.loadid,
        required this.load,
        required this.speedid,
        required this.speed,
        required this.travelid,
                required this.travel,
        required this.stopid,
        required this.stop,
        required this.openingid,
        required this.opening,
        required this.controlid,
        required this.control,
        required this.operationid,
        required this.operation,
        required this.machineid,
        required this.machine,
        required this.hoistwaysize,
        required this.carsize,
        required this.carenclosure,
        required this.hoistwaydoors,
        required this.entrances,
        required this.dooroperation,
        required this.delivery,
        required this.erection,
        required this.powerSupply,
        required this.subtotal,
        required this.total,
         
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        proposalid: json["proposalid"],
        subject: json["subject"],
        related: json["related"],
        lead: json["lead"],
        date: DateTime.parse(json["date"]),
        openTill: DateTime.parse(json["open_till"]),
        currencyid: json["currencyid"],
        currency: json["currency"],
        symbol: json["symbol"],
        discountType: json["discount_type"],
        statusid: json["statusid"],
        status: json["status"],
        assignedid: json["assignedid"],
        assign: json["assign"],
        to: json["to"],
        address: json["address"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        zip: json["zip"],
        toemail: json["toemail"],
        phone: json["phone"],
        liftpriceid: json["liftpriceid"],
        typeid: json["typeid"],
        type: json["type"],
        floorid: json["floorid"],
        floor: json["floor"],
        specificationid: json["specificationid"],
        specification: json["specification"],
        passenger: json["passenger"],
        loadid: json["loadid"],
        load: json["load"],
        speedid: json["speedid"],
        speed: json["speed"],
        travelid: json["travelid"],
        travel: json["travel"],
        stopid: json["stopid"],
        stop: json["stop"],
        openingid: json["openingid"],
        opening: json["opening"],
        controlid: json["controlid"],
        control: json["control"],
        operationid: json["operationid"],
        operation: json["operation"],
        machineid: json["machineid"],
        machine: json["machine"],
        hoistwaysize: json["hoistwaysize"],
        carsize: json["carsize"],
        carenclosure: json["carenclosure"],
        hoistwaydoors: json["hoistwaydoors"],
        entrances: json["entrances"],
        dooroperation: json["dooroperation"],
        delivery: json["delivery"],
        erection: json["erection"],
        powerSupply: json["power_supply"],
        subtotal: json["subtotal"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "proposalid": proposalid,
        "subject": subject,
        "related": related,
        "lead": lead,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "open_till": "${openTill.year.toString().padLeft(4, '0')}-${openTill.month.toString().padLeft(2, '0')}-${openTill.day.toString().padLeft(2, '0')}",
        "currencyid": currencyid,
        "currency": currency,
        "symbol": symbol,
        "discount_type": discountType,
        "statusid": statusid,
        "status": status,
        "assignedid": assignedid,
        "assign": assign,
        "to": to,
        "address": address,
        "city": city,
        "state": state,
        "country": country,
        "zip": zip,
        "toemail": toemail,
        "phone": phone,
        "liftpriceid": liftpriceid,
        "typeid": typeid,
        "type": type,
        "floorid": floorid,
        "floor": floor,
        "specificationid": specificationid,
        "specification": specification,
        "passenger": passenger,
        "loadid": loadid,
        "load": load,
        "speedid": speedid,
        "speed": speed,
        "travelid": travelid,
        "travel": travel,
        "stopid": stopid,
        "stop": stop,
        "openingid": openingid,
        "opening": opening,
        "controlid": controlid,
        "control": control,
        "operationid": operationid,
        "operation": operation,
        "machineid": machineid,
        "machine": machine,
        "hoistwaysize": hoistwaysize,
        "carsize": carsize,
        "carenclosure": carenclosure,
        "hoistwaydoors": hoistwaydoors,
        "entrances": entrances,
        "dooroperation": dooroperation,
        "delivery": delivery,
        "erection": erection,
        "power_supply": powerSupply,
        "subtotal": subtotal,
        "total": total,
    };
}
