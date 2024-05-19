import 'dart:developer';

import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:http/http.dart' as http;
import 'package:leadingmanagementsystem/model/map_trak_model.dart';

 

class MapTrackService {
  Future mapTrackService(
      {latitude,longitude, 
      time,flag,logout
      }) async {
         SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var staffid = sharedPreferences.getString(Constants.staffid);
    log('enterrrrr');
    try {
      var data = {
       "dashboard":"addservicetemptrack",
    "staffid":staffid??'',
    "latitude":latitude??"",
    "longitude":longitude??'',
    "time":time??"",
    "flag":flag??"",
    "logout":logout??''
     
        
      };
       
      var jsonencode=jsonEncode(data);
      
      log(jsonencode.toString());

      log(data.toString());
      log('dddddddddddd');

      var response =
          await http.post(Uri.parse('https://professionalelevators.in/api/getDetails.php'), body: jsonencode);
          log('fffffffff');

      var jsonresponse = jsonDecode(response.body);
      log(response.body.toString());
      print(response.body);

      if (response.statusCode == 200) {
        
          
          return MapTrackModel.fromJson(jsonresponse);
        } 
        else {
          log(jsonresponse['message'].toString());
         
          //Get.back();
        }
      
    } catch (e) {
      rethrow;
    }
  }
}
