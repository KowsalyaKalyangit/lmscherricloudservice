import 'dart:developer';

import '../allpackages.dart';
import '../model/forgot-password_model.dart';
import '../service/forgot_password_service.dart';

 

class ForgotPasswordController extends GetxController {
  TextEditingController email = TextEditingController();
  var forgotpasswordService = ForgotPasswordService();
  List<ForgotPasswordModel>  _forgotpassword=[];
  List<ForgotPasswordModel> get getforgotpassword=>_forgotpassword;

  Future forgotPasswordController() async {
    try {
      var response = await forgotpasswordService.forgotPasswordService(email: email.text
         );
      log('mobile---${response}');
      if (response != null) {
        _forgotpassword.clear();
        _forgotpassword.add(response);
         
       // Get.toNamed('/forgototp');
      } else {
         Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}
