
import 'dart:developer';

import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/service/dashboard_category_service.dart';
 
 
 

import '../model/dashboard_category_model.dart';
 

class DashboardCategoryController extends GetxController{
  List<DashboardCategoryModel> _dashboardcategoryetails=[];
  List<DashboardCategoryModel> get getdashboardcategorydetails=>_dashboardcategoryetails;
   RxBool isDashboardCategoryLoad = true.obs;
   DashboardCategoryService dashboardCategoryService=DashboardCategoryService();
  Future dashboardCategoryController({statusid}) async {
    isDashboardCategoryLoad(true);
    try {
      var response = await dashboardCategoryService.dashboardCategoryService(statusid: statusid);
      log(response.toString());
      if (response != null) {
        _dashboardcategoryetails.clear();
        print('res---------------$response');
        _dashboardcategoryetails.add(response);
       
           
      
        isDashboardCategoryLoad(false);
        
         
      } else {
        isDashboardCategoryLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}