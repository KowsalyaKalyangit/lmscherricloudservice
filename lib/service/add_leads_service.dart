import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:leadingmanagementsystem/model/add_leads_response.dart';
import 'package:leadingmanagementsystem/model/leads_country_response.dart';

import '../allpackages.dart';

 

class AddLeadsService {
  Future addLeadsService(
      {name,position,email,phone,leadvalue,company,description,
      address,city,state,country,zipcode,status,source
      }) async {
         SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var staffid = sharedPreferences.getString(Constants.staffid);
    log('enterrrrr');
    try {
      var data = {
        "dashboard": "addlead",
        "staffid":staffid??'',
    "name":name??"",
    "position":position??"",
    "email":email??"",
    "phone":phone??"",
    "leadvalue":leadvalue??"",
    "company":company??'',
    "description":description??'',
    "address":address??'',
    "city":city??"",
    "state":state??"",
    "country":country??'',
    "zipcode":zipcode??"",
    "status":status??'',
    "source":source??''
        
      };
      var jsonencode=jsonEncode(data);

      log(data.toString());
      log('dddddddddddd');

      var response =
          await http.post(Uri.parse(Urls.lead_country), body: jsonencode);

      var jsonresponse = jsonDecode(response.body);
      log(response.body.toString());

      if (response.statusCode == 200) {
        
          Fluttertoast.showToast(msg: jsonresponse['message'].toString());
          return AddLeadsModel.fromJson(jsonresponse);
        } 
        else {
          log(jsonresponse['message'].toString());
          Fluttertoast.showToast(msg: jsonresponse['message'].toString());
          //Get.back();
        }
      
    } catch (e) {
      rethrow;
    }
  }
}
