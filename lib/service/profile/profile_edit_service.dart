import 'dart:developer';
import 'package:http/http.dart' as http;

import '../../allpackages.dart';
import '../../model/profile_edit_response.dart';
import '../../model/profile_response.dart';
 
 
 

 

class ProfileEditService {
  Future profileEditService(
      {firstname,lastname,facebook,linkedin,phonenumber}) async {
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var staffid = sharedPreferences.getString(Constants.staffid);
    log('enterrrrr');
    try {
      var data = {
        "dashboard": "updateprofiledetails",
        "staffid":staffid??"",
        "firstname":firstname??"",
        "lastname":lastname??'',
        
        "facebook":facebook??'',
        "linkedin":linkedin??'',
        "phonenumber":phonenumber??''
        


        
      };
        var jsonencode=jsonEncode(data);

      log(data.toString());
      log('dddddddddddd');

      var response =
          await http.post(Uri.parse(Urls.lead_country), body: jsonencode);

      var jsonresponse = jsonDecode(response.body);
      log(response.body.toString());

      if (response.statusCode == 200) {
        
          Fluttertoast.showToast(msg: jsonresponse['message']);
           
          return ProfilEditModel.fromJson(jsonDecode(response.body));
        } else {
          Fluttertoast.showToast(msg: jsonresponse['message'].toString());
          Get.back();
        }
      
    } catch (e) {
      rethrow;
    }
  }
}
