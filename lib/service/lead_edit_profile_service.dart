import 'dart:developer';
import 'package:http/http.dart' as http;

import '../allpackages.dart';

import '../model/lead_profile_edit_response.dart';
import '../model/leads_profile_response.dart';

class LeadEditProfileService {
  Future leadProfileEditService(
      {leadid,
      name,
      position,
      email,
      phonenumber,
      value,
      company,
      description,
      country,
      zip,
      city,
      state,
      address,
      status,
      source}) async {
    log('enterrrrr');

    try {
      var data = 
        {
          "dashboard": "updateleadprofiledetails",
          "leadid": leadid ?? "",
          "name": name ?? '',
          "position": position ?? '',
          "email": email ?? '',
          "phonenumber": phonenumber ?? '',
          "value": value ?? '',
          "company": company ?? '',
          "description": description ?? "",
          "country": country ?? '',
          "zip": zip ?? '',
          "city": city ?? '',
          "state": state ?? '',
          "address": address ?? '',
          "status": status ?? "",
          "source": source ?? ""
        
      };
      var jsonencode = jsonEncode(data);

      log(data.toString());
      log('dddddddddddd');

      var response =
          await http.post(Uri.parse(Urls.lead_country), body: jsonencode);

      var jsonresponse = jsonDecode(response.body);
      log(response.body.toString());

      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: jsonresponse['message']);
        return LeadsProfileEditModel.fromJson(jsonresponse);
      } else {
        Fluttertoast.showToast(msg: jsonresponse['message'].toString());
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}
