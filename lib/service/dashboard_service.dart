import 'dart:developer';
import 'package:http/http.dart' as http;
 
import '../allpackages.dart';
import '../model/dashboard_model.dart';
import '../model/leads_details_response.dart';
 

 

class DashboardService {
  Future dashboardService(
      {dashboard}) async {
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var staffid = sharedPreferences.getString(Constants.staffid);
    log('enterrrrr');
    try {
      var data = {
        "dashboard": "getdashboarddetails",
        "staffid":staffid??""
        
      };
        var jsonencode=jsonEncode(data);

      log(data.toString());
      log('dddddddddddd');

      var response =
          await http.post(Uri.parse(Urls.lead_country), body: jsonencode);

      var jsonresponse = jsonDecode(response.body);
      log(response.body.toString());

      if (response.statusCode == 200) {
        
         // Fluttertoast.showToast(msg: jsonresponse['message']);
          return DashboardModel.fromJson(jsonresponse);
        } else {
          //Fluttertoast.showToast(msg: jsonresponse['message'].toString());
          Get.back();
        }
      
    } catch (e) {
      rethrow;
    }
  }
}
