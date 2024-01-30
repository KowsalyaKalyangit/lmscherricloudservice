import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:leadingmanagementsystem/model/leads_country_response.dart';

import '../allpackages.dart';
import '../model/leads_source_model.dart';
import '../model/leads_status_response.dart';

 

class LeadsSourceService {
  Future leadsSourceService(
      {dashboard}) async {
    log('enterrrrr');
    try {
      var data = {
        "dashboard": "getleadsourcedetails",
        
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
          return LeadsSourceModel.fromJson(jsonresponse);
        } else {
          Fluttertoast.showToast(msg: jsonresponse['message'].toString());
          Get.back();
        }
      
    } catch (e) {
      rethrow;
    }
  }
}
