
import 'dart:developer';

import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/model/attachement_details_response.dart';
import 'package:leadingmanagementsystem/service/get_attachement_service.dart';
 
 

class AttchamentLeadsDetailsController extends GetxController{
  List<AttachmentDetailsModel> _attchamentleadsDetails=[];
  List<AttachmentDetailsModel> get getattachmentleadsdetails=>_attchamentleadsDetails;
   RxBool isLeadsDetailsLoad = true.obs;
   AttachmentDetailsService leadsDetailsService=AttachmentDetailsService();
  Future getAttchamentLeadsDetailsController({leadid}) async {
   isLeadsDetailsLoad(true);
    try {
      var response = await leadsDetailsService.getAttachmentDetailsService(leadid: leadid);
      log(response.toString());
      if (response != null) {
        _attchamentleadsDetails.clear();
        print('res---------------$response');
        _attchamentleadsDetails.add(response);
       
           
      
        isLeadsDetailsLoad(false);
        update(['delete']);
        
         
      } else {
        isLeadsDetailsLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}