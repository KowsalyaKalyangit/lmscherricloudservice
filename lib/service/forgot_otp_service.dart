import 'dart:developer';

import 'package:leadingmanagementsystem/view/forgot_password/create_password.dart';

import '../allpackages.dart';
import 'package:http/http.dart' as http;

import '../model/forgot-password_model.dart';
import '../model/forgot_otp_response.dart';

class ForgotOtpService {
  Future  forgotOtpService(
      { responseotp,staffotp}) async {
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
   // var staffid = sharedPreferences.getString(Constants.staffid);
    
    var body = {
      "dashboard": "otpvalidate",
      "responseotp": responseotp ?? '',
      "staffotp":staffotp??"",
      // "staffid":staffid??""
      
    };
    var bodyencode = json.encode(body);

    log(body.toString());
    try {
      var response = await http.post(
        Uri.parse(Urls.lead_country),
        body: bodyencode,
        // headers: {'Authorization': 'Bearer ${Constants.token}'},
      );

      log(response.body.toString());
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if(data['status']=="Success")
        {
           Fluttertoast.showToast(msg: data['message'].toString());
        
       return ForgotOtpModel.fromJson(data);

        }
       
      } 
      
      else {
        Fluttertoast.showToast(msg: data['message'].toString());
          // Get.back();
           
      }
    } catch (e) {
      rethrow;
    }
  }
}
