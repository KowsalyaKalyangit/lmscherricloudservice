
import 'dart:developer';

import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/model/attachement_details_response.dart';
import 'package:leadingmanagementsystem/service/attachement_delete_service.dart';
 
 
 

class AttchamentDeleteController extends GetxController{
  List<AttachmentDetailsModel> _attchamentdleteDetails=[];
  List<AttachmentDetailsModel> get getattachmentleadsdetails=>_attchamentdleteDetails;
   RxBool isLeadsDetailsLoad = true.obs;
   AttachmentDeleteService attachmentDeleteService=AttachmentDeleteService();
  Future attachmentDeleteController({leadid,attachementid}) async {
    // isLeadsDetailsLoad(true);
    try {
      var response = await attachmentDeleteService.attachmentDeleteService(leadid: leadid,attachementid: attachementid);
      log(response.toString());
      if (response != null) {
        _attchamentdleteDetails.clear();
        print('res---------------$response');
        
       
           
      
        isLeadsDetailsLoad(false);
        
        
         
      } else {
        isLeadsDetailsLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}