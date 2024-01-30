
import 'dart:developer';

import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/model/leads_details_response.dart';
import 'package:leadingmanagementsystem/service/get_leads_service.dart';

class LeadsDetailsController extends GetxController{
  List<LeadsDetailsModel> _leadsDetails=[];
  List<LeadsDetailsModel> get getleadsdetails=>_leadsDetails;
   RxBool isLeadsDetailsLoad = true.obs;
   LeadsDetailsService leadsDetailsService=LeadsDetailsService();
  Future leadsDetailsController() async {
    isLeadsDetailsLoad(true);
    try {
      var response = await leadsDetailsService.leadsDetailsService();
      log(response.toString());
      if (response != null) {
        _leadsDetails.clear();
        print('res---------------$response');
        _leadsDetails.add(response);
       
           
      
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