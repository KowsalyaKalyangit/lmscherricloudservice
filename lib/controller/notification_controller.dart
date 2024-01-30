
import 'dart:developer';

import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/model/notification_response.dart';
import 'package:leadingmanagementsystem/model/leads_details_response.dart';
import 'package:leadingmanagementsystem/service/get_leads_service.dart';
import 'package:leadingmanagementsystem/service/notification_service.dart';

class NotificationController extends GetxController{
  List<NotificationModel> _notificationDetails=[];
  List<NotificationModel> get getnotification=>_notificationDetails;
   RxBool isnotificationLoad = true.obs;
   NotificationService notificationService=NotificationService();
  Future notificationController() async {
    isnotificationLoad(true);
    try {
      var response = await notificationService.notificationService();
      log(response.toString());
      if (response != null) {
        _notificationDetails.clear();
        print('res---------------$response');
        _notificationDetails.add(response);
       
           
      
        isnotificationLoad(false);
        
         
      } else {
        isnotificationLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}