 
 
// import 'dart:developer';
// import 'dart:io';

// import 'package:dio/dio.dart' as dio;
 
 
 
 
 
// import '../allpackages.dart';
 
 
 

 

// class AttachementUploadService {
//   // Future attachementuploadService(
//   //     {File ?file,leadid}) async {
//   //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//   //   var staffid = sharedPreferences.getString(Constants.staffid);
        
//   //   try {
    
//   //    var formdata=FormData({
//   //     "file": file??"",
//   //       "dashboard":"addleadattachment",
//   //       "leadid":leadid??'',
//   //       "staffid":staffid??''

//   //    });
    
       
//   //       var jsonencode=jsonEncode(formdata);

//   //     log(formdata.toString());
//   //     log('dddddddddddd');

//   //   final response = await dio.Dio().post(
//   //       Urls.lead_country,
//   //       data: jsonencode,
//   //       options:dio. Dio().options(
//   //           headers: {
//   //             'Content-Type': 'application/json',
             
//   //           },
//   //         ));
        
      

//   //     var jsonresponse = jsonDecode(response.data);
//   //     log(response.data.toString());

//   //     if (response.statusCode == 200) {
        
//   //         Fluttertoast.showToast(msg: jsonresponse['message']);
//   //         return AttachmentUploadModel.fromJson(jsonresponse);
//   //       } else {
//   //         Fluttertoast.showToast(msg: jsonresponse['message'].toString());
//   //         Get.back();
//   //       }
      
//   //   } catch (e) {
//   //     rethrow;
//   //   }
//   // }

 
  
    

//  attachmentuploadService({File ? file,filename}) async {
 
//   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     var staffid = sharedPreferences.getString(Constants.staffid);
//   var formData = dio.FormData.fromMap({
//     'files': [
//     await dio.MultipartFile.fromFile(file!.toString(),filename: filename)
//   ],
//   'dashboard': 'addleadattachment',
//   'leadid': '5',
//   'staffid': '3'
//   });

//   try {
//    // final response = await dio. Dio().post(Urls.lead_country, data: formData);
//     var response = await dio.Dio().post(
//   'cherritech.us/proelevators/api/getDetails.php',
//   options: dio.Options(
//     method: 'POST',
//   ),
//   data: formData,
// );

//     // Handle the response here
//     print(response.data);
//   } catch (e) {
//     // Handle any errors here
//     print('Error uploading image: $e');
//   }
// }




//   registerEmployeeFace(
//       {required File empFace, required String empCode}) async {
//     final url =
//         'https://cherritech.us/proelevators/api/getDetails.php';
//     try {
//       var formData = dio.FormData.fromMap({
//         'file': await dio.MultipartFile.fromFile(empFace.path, filename: empCode,),
        
//       });
//       final response = await dio.Dio().post(
//         url,
//         data: formData,
        
//       );
//       if (response.statusCode == 200) {
//         var map = response.data as Map;
//         print('success');
//         if (map['status'] == 'Successfully registered') {
//           return true;
//         } else {
//           return false;
//         }
//       } else if(response.statusCode == 200) {
//         //BotToast is a package for toasts available on pub.dev
//         Fluttertoast.showToast(msg: 'Validation Error Occurs');
//         return false;
//       }
//     } on dio.DioError catch (error) {
//       log(error.message.toString());
//       throw Exception(error);
//     } catch (_) {
//       log(_.toString());
//       throw 'Something Went Wrong';
//     }
//   }
// }
import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/model/attachment_upload_model.dart';
import 'package:leadingmanagementsystem/view/assign/attachement_upload.dart';

class FileUploadService {
   
 

  Future createCatgory({ image,id}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var staffid = sharedPreferences.getString(Constants.staffid);
    dynamic jsonResponse;

    dio.FormData formData = dio.FormData.fromMap({
          'dashboard': 'addleadattachment',
  'leadid': id??"",
  'staffid': staffid??"",
      "file": await dio.MultipartFile.fromFile(
        image,
      ),
    });
    
    try {
      var response = await dio.Dio().post(Urls.lead_country,
          data: formData,
          options: dio.Options(
            headers: {
              'Content-Type': 'application/json',
              
            },
          ));
       
      jsonResponse = response.data;
      if (response.statusCode == 200) {
         if(jsonResponse['success']==1){
           Fluttertoast.showToast(msg: 'File uploaded Successfully');
         }
         Get.back();
        return AttachmentUploadModel.fromJson(response.data);
        
      } else {
        
        
        return null;
      }
    } on dio.DioError catch (e) {
      log("error-->$e");
    }
  }
}
