
import 'dart:developer';

import 'package:leadingmanagementsystem/allpackages.dart';
 
import 'package:leadingmanagementsystem/service/dashboard_service.dart';
 

import '../model/dashboard_model.dart';

class DashboardController extends GetxController{
  List<DashboardModel> _dashboardetails=[];
  List<DashboardModel> get getdashboarddetails=>_dashboardetails;
   RxBool isDashboardLoad = true.obs;
   DashboardService dashboardService=DashboardService();
  Future dashboardController() async {
    isDashboardLoad(true);
    try {
      var response = await dashboardService.dashboardService();
      log(response.toString());
      if (response != null) {
        _dashboardetails.clear();
        print('res---------------$response');
        _dashboardetails.add(response);
       
           
      
        isDashboardLoad(false);
        
         
      } else {
        isDashboardLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}