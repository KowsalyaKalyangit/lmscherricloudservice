
// import 'dart:developer';
// import 'dart:io';

// import 'package:image_picker/image_picker.dart';
// import 'package:leadingmanagementsystem/allpackages.dart';
 
// import 'package:leadingmanagementsystem/service/upload_service.dart';

// import '../model/attachment_upload_model.dart';

// class AttachmentUploadController extends GetxController{
//   List<AttachmentUploadModel> _tasksadd=[];
//   List<AttachmentUploadModel> get getleadsdetails=>_tasksadd;
//    RxBool isTasksGetLoad = true.obs;
 
//    FileUploadService uploadService=FileUploadService();
//   Future attachmentuploadController({filePath}) async {
//     print('conn');
//     isTasksGetLoad(true);
//     try {
//       var response = await uploadService.uploadFile(filePath: filePath);
//       log(response.toString());
//       if (response != null) {
//         _tasksadd.clear();
//         print('res---------------$response');
//         _tasksadd.add(response);
       
           
      
//         isTasksGetLoad(false);
        
         
//       } else {
//         isTasksGetLoad(false);
//         Get.back();
//       }
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
import 'dart:io';

 
 
import 'package:leadingmanagementsystem/model/attachment_upload_model.dart';
 

import '../allpackages.dart';
import '../service/upload_service.dart';
 

class FileUploadController extends GetxController {
  final FileUploadService _fileUploadService = FileUploadService();
  final RxString uploadedFileUrl = ''.obs;
  Rx<File> categoryImage = File('').obs;
   RxBool imageload = true.obs;

  List<AttachmentUploadModel> _uploadlist=[];
  List<AttachmentUploadModel> get getupload=>_uploadlist;

    Future createCategory({id}) async {
       
       
    
    try {
      var data = await _fileUploadService.createCatgory(id:id,
          
          image: categoryImage.value.path);
      if (data != null) {
        _uploadlist.clear();
        _uploadlist.add(data);
        //Fluttertoast.showToast(msg: data.message!);
        
         categoryImage(File(''));
         
        
         imageload(false);
         
          
        
      
        
      } else {
        imageload(false);
        Get.back();
         
      }
    } catch (e) {
      rethrow;
    }
    }}

 
