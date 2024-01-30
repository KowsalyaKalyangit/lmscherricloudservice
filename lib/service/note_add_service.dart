import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:leadingmanagementsystem/allpackages.dart';
 

import '../model/noted_add_response.dart';

class NoteAddService {
   
 

  Future noteAddService({ image,leadid}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var staffid = sharedPreferences.getString(Constants.staffid);
    dynamic jsonResponse;

    dio.FormData formData = dio.FormData.fromMap({
          'dashboard': 'addleadvoicenotes',
  'leadid':leadid,
  'staffid': staffid??'',
      "file": await dio.MultipartFile.fromFile(
        image,
       //filename: 'audio_file.mp3'
      //  filename:"audio"
       
        
      ),
    });
    
    try {
      var response = await dio.Dio().post(Urls.lead_country,
          data: formData,
          options: dio.Options(
            headers: {
               'Content-Type': 'application/json',
            //'Content-Type':"audio/webm" 
              
            },
          ));
       
      jsonResponse = response.data;
      if (response.statusCode == 200) {
         
       Fluttertoast.showToast(msg: 'File uploaded Successfully');
         
        
        return NotesAddModel.fromJson(jsonResponse);
        
      } else {
        
         
        return null;
      }
    } on dio.DioError catch (e) {
      log("error-->$e");
    }
  }
}
