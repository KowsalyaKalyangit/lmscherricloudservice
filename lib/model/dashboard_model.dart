// To parse this JSON data, do
//
//     final dashboardModel = dashboardModelFromJson(jsonString);

import 'dart:convert';

DashboardModel dashboardModelFromJson(String str) => DashboardModel.fromJson(json.decode(str));

String dashboardModelToJson(DashboardModel data) => json.encode(data.toJson());

class DashboardModel {
    int success;
    String status;
    String message;
    int totalLeads;
    int totalStatus;
   
    List<Datum> leadslist;
    List<Datum> data;

    DashboardModel({
        required this.success,
        required this.status,
        required this.message,
        required this.totalLeads,
        required this.totalStatus,
        
        required this.leadslist,
        required this.data,
    });

    factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
        success: json["success"],
        status: json["status"],
        message: json["message"],
        totalLeads: json["TotalLeads"],
        totalStatus: json["TotalStatus"],
     
        leadslist: List<Datum>.from(json["leadslist"].map((x) => Datum.fromJson(x))),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
        "TotalLeads": totalLeads,
        "TotalStatus": totalStatus,
      
        "leadslist": List<dynamic>.from(leadslist.map((x) => x.toJson())),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String id;
    String name;
    String total;
    String? status;

    Datum({
        required this.id,
        required this.name,
        required this.total,
        this.status,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        total: json["Total"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "Total": total,
        "status": status,
    };
}

class Graph {
    String id;
    String? customer;
    String? finalStatus;
    String? proposalSubmited;
    String? spokenToCustomer;

    Graph({
        required this.id,
        this.customer,
        this.finalStatus,
        this.proposalSubmited,
        this.spokenToCustomer,
    });

    factory Graph.fromJson(Map<String, dynamic> json) => Graph(
        id: json["id"],
        customer: json["Customer"],
        finalStatus: json["Final Status"],
        proposalSubmited: json["Proposal Submited"],
        spokenToCustomer: json["Spoken to Customer"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "Customer": customer,
        "Final Status": finalStatus,
        "Proposal Submited": proposalSubmited,
        "Spoken to Customer": spokenToCustomer,
    };
}
