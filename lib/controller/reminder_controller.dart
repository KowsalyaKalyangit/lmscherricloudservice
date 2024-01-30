
import 'dart:developer';

import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/model/converted_leads_model.dart';
import 'package:leadingmanagementsystem/model/reminderModel_response.dart';
 
import 'package:leadingmanagementsystem/service/converted_leads_service.dart';
import 'package:leadingmanagementsystem/service/reminder_service.dart';
 
class ReminderController extends GetxController{
  List<ReminderModel> _reminderleads=[];
  List<ReminderModel> get getreminderdetails=>_reminderleads;
   RxBool isreminderLoad = true.obs;
   ReminderService reminderService=ReminderService();
  Future reminderController({leadid}) async {
    isreminderLoad(true);
    try {
      var response = await reminderService.reminderService(leadid:leadid );
      log(response.toString());
      if (response != null) {
        _reminderleads.clear();
        print('res---------------$response');
        _reminderleads.add(response);
       
           
      
        isreminderLoad(false);
        
         
      } else {
        isreminderLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}