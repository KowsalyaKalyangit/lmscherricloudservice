// To parse this JSON data, do
//
//     final addTasksModel = addTasksModelFromJson(jsonString);

import 'dart:convert';

AddTasksModel addTasksModelFromJson(String str) => AddTasksModel.fromJson(json.decode(str));

String addTasksModelToJson(AddTasksModel data) => json.encode(data.toJson());

class AddTasksModel {
    int success;
    String status;
    String message;
    List<Datum> data;

    AddTasksModel({
        required this.success,
        required this.status,
        required this.message,
        required this.data,
    });

    factory AddTasksModel.fromJson(Map<String, dynamic> json) => AddTasksModel(
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
    String taskid;
    String name;
    String status;
    String startdate;
    String duedate;
    String assignedby;
    String priority;
    List<Tag> tag;

    Datum({
        required this.taskid,
        required this.name,
        required this.status,
        required this.startdate,
        required this.duedate,
        required this.assignedby,
        required this.priority,
        required this.tag,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        taskid: json["taskid"]??'',
        name: json["name"]??'',
        status: json["status"]??"",
        startdate:  json["startdate"]??'',
        duedate: json["duedate"]
        ??"",
        assignedby: json["assignedby"]??'',
        priority: json["priority"]??"",
        tag: List<Tag>.from(json["tag"].map((x) => Tag.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "taskid": taskid,
        "name": name,
        "status": status,
        "startdate":startdate,
        "duedate": duedate,
        "assignedby": assignedby,
        "priority": priority,
        "tag": List<dynamic>.from(tag.map((x) => x.toJson())),
    };
}

class Tag {
    String name;

    Tag({
        required this.name,
    });

    factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
    };
}
