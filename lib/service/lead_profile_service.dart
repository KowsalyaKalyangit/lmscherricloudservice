import 'dart:developer';
import 'package:http/http.dart' as http;
 
import '../allpackages.dart';
 
import '../model/leads_profile_response.dart';
 

 

class LeadProfileService {
  Future leadProfileService(
       ) async {
        
    log('enterrrrr');
   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var staffid = sharedPreferences.getString(Constants.staffid);
    try {
      var data = {
        "dashboard":"getleadprofiledetails",
        "staffid":staffid??''
        
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
          return LeadsProfileModel.fromJson(jsonresponse);
        } else {
          Fluttertoast.showToast(msg: jsonresponse['message'].toString());
          Get.back();
        }
      
    } catch (e) {
      rethrow;
    }
  }
}
