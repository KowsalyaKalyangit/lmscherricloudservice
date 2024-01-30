// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    int success;
    String message;
    String firstname;
    String lastname;
    String email;
    String phonenumber;
    String profileImage;
    String facebook;
    String linkedin;
    String skype;
    String staffid;
    String token;

    LoginModel({
        required this.success,
        required this.message,
        required this.firstname,
        required this.lastname,
        required this.email,
        required this.phonenumber,
        required this.profileImage,
        required this.facebook,
        required this.linkedin,
        required this.skype,
        required this.staffid,
        required this.token,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        success: json["success"]??'',
        message: json["message"]??'',
        firstname: json["firstname"]??'',
        lastname: json["lastname"]??"",
        email: json["email"]??'',
        phonenumber: json["phonenumber"]??'',
        profileImage: json["profile_image"]??'',
        facebook: json["facebook"]??'',
        linkedin: json["linkedin"]??'',
        skype: json["skype"]??'',
        staffid: json["staffid"]??"",
        token: json["token"]??"",
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "phonenumber": phonenumber,
        "profile_image": profileImage,
        "facebook": facebook,
        "linkedin": linkedin,
        "skype": skype,
        "staffid": staffid,
        "token": token,
    };
}


 
