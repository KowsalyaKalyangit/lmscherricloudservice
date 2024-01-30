// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
    int success;
    String status;
    String message;
    List<Datum> data;

    ProfileModel({
        required this.success,
        required this.status,
        required this.message,
        required this.data,
    });

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
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
    String staffid;
    String email;
    String firstname;
    String lastname;
    String role;
    String phonenumber;
    String profileImage;

    Datum({
        required this.staffid,
        required this.email,
        required this.firstname,
        required this.lastname,
        required this.role,
        required this.phonenumber,
        required this.profileImage,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        staffid: json["staffid"],
        email: json["email"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        role: json["role"],
        phonenumber: json["phonenumber"]??"",
        profileImage: json["profile_image"],
    );

    Map<String, dynamic> toJson() => {
        "staffid": staffid,
        "email": email,
        "firstname": firstname,
        "lastname": lastname,
        "role": role,
        "phonenumber": phonenumber,
        "profile_image": profileImage,
    };
}
