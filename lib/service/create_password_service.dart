import 'dart:developer';
import '../allpackages.dart';
import 'package:http/http.dart' as http;

import '../model/forgot_otp_response.dart';

class CreatePasswordsService {
  Future createPasswordsService({newpassword, confirmpassword}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var staffid = sharedPreferences.getString(Constants.staffid);

    var body = {
      "dashboard": "createpassword",
      "newpassword": newpassword ?? '',
      "confirmpassword": confirmpassword ?? "",
      "staffid": staffid ?? ""
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
        Fluttertoast.showToast(msg: data['message'].toString());

        return ForgotOtpModel.fromJson(data);
      } else {
        Fluttertoast.showToast(msg: data['message'].toString());
        //Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}
