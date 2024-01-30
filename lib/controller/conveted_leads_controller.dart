
import 'dart:developer';

import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/model/converted_leads_model.dart';
 
import 'package:leadingmanagementsystem/service/converted_leads_service.dart';
 
class ConvertedLeadsController extends GetxController{
  List<ConvertedLeadsModel> _convertedleads=[];
  List<ConvertedLeadsModel> get getnotification=>_convertedleads;
   RxBool isleadLoad = true.obs;
   ConvertedLeadsService convertedLeadsService=ConvertedLeadsService();
  Future convertedLeadsController() async {
    isleadLoad(true);
    try {
      var response = await convertedLeadsService.convertedLeadsService();
      log(response.toString());
      if (response != null) {
        _convertedleads.clear();
        print('res---------------$response');
        _convertedleads.add(response);
       
           
      
        isleadLoad(false);
        
         
      } else {
        isleadLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}