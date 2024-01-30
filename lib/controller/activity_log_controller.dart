
import 'dart:developer';

import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/model/notification_response.dart';
import 'package:leadingmanagementsystem/model/leads_details_response.dart';
import 'package:leadingmanagementsystem/service/activity_log_service.dart';
import 'package:leadingmanagementsystem/service/get_leads_service.dart';
import 'package:leadingmanagementsystem/service/notification_service.dart';

import '../model/activiylog_response.dart';

class ActivityController extends GetxController{
  List<ActivityLogModel> _activityDetails=[];
  List<ActivityLogModel> get getnotification=>_activityDetails;
   RxBool isactivityLoad = true.obs;
   ActivityService activityService=ActivityService();
  Future notificationController({leadid}) async {
    isactivityLoad(true);
    try {
      var response = await activityService.activityService(leadid:leadid);
      log(response.toString());
      if (response != null) {
        _activityDetails.clear();
        print('res---------------$response');
        _activityDetails.add(response);
       
           
      
        isactivityLoad(false);
        
         
      } else {
        isactivityLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}