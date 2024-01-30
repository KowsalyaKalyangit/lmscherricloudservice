
import 'dart:developer';

import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/model/add_tasks_model.dart';
 
import 'package:leadingmanagementsystem/service/get_tasks_service.dart';

class TasksGetController extends GetxController{
  List<AddTasksModel> _tasksadd=[];
  List<AddTasksModel> get getleadsdetails=>_tasksadd;
   RxBool isTasksGetLoad = true.obs;
   TasksGetService tasksGetService=TasksGetService();
  Future tasksGetController({leadid}) async {
    isTasksGetLoad(true);
    try {
      var response = await tasksGetService.tasksGetService(leadid: leadid);
      log(response.toString());
      if (response != null) {
        _tasksadd.clear();
        print('res---------------$response');
        _tasksadd.add(response);
       
           
      
        isTasksGetLoad(false);
        
         
      } else {
        isTasksGetLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}