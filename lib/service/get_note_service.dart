import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:leadingmanagementsystem/model/note_details_response.dart';
 
import '../allpackages.dart';
import '../model/leads_details_response.dart';
 

 

class NoteDetailsService {
  Future noteDetailsService(
       {leadid}) async {
      
    
    log('enterrrrr');
    try {
      var data = {
        "dashboard": "getleadnotes",
        "leadid":leadid??""
        
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
          return NotesDetailsModel.fromJson(jsonresponse);
        } else {
          Fluttertoast.showToast(msg: jsonresponse['message'].toString());
          Get.back();
        }
      
    } catch (e) {
      rethrow;
    }
  }
}
