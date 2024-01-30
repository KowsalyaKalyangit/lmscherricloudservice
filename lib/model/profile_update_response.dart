// To parse this JSON data, do
//
//     final profileUpdateModel = profileUpdateModelFromJson(jsonString);

import 'dart:convert';

ProfileUpdateModel profileUpdateModelFromJson(String str) => ProfileUpdateModel.fromJson(json.decode(str));

String profileUpdateModelToJson(ProfileUpdateModel data) => json.encode(data.toJson());

class ProfileUpdateModel {
    int success;
    String status;
    String message;
    List<Datum> data;

    ProfileUpdateModel({
        required this.success,
        required this.status,
        required this.message,
        required this.data,
    });

    factory ProfileUpdateModel.fromJson(Map<String, dynamic> json) => ProfileUpdateModel(
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
        staffid: json["staffid"]??'',
        email: json["email"]??'',
        firstname: json["firstname"]??'',
        lastname: json["lastname"]??'',
        role: json["role"]??'',
        phonenumber: json["phonenumber"]??'',
        profileImage: json["profile_image"]??'',
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
