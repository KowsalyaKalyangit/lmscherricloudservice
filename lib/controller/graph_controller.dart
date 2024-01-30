
import 'dart:developer';

import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/model/graph_response.dart';
import 'package:leadingmanagementsystem/model/notification_response.dart';
import 'package:leadingmanagementsystem/model/leads_details_response.dart';
import 'package:leadingmanagementsystem/service/get_leads_service.dart';
import 'package:leadingmanagementsystem/service/graoph_service.dart';
import 'package:leadingmanagementsystem/service/notification_service.dart';

class GraphController extends GetxController{
  List<GraphModel> _notificationDetails=[];
  List<GraphModel> get getnotification=>_notificationDetails;
   RxBool isnotificationLoad = true.obs;
   GraphService notificationService=GraphService();
  Future graphController() async {
    isnotificationLoad(true);
    try {
      var response = await notificationService.graphService();
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