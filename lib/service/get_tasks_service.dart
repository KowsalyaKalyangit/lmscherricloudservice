import 'dart:developer';
import 'package:http/http.dart' as http;
 
import '../allpackages.dart';
import '../model/add_tasks_model.dart';
import '../model/leads_details_response.dart';
 

 

class TasksGetService {
  Future tasksGetService({leadid}
       ) async {
        
    log('enterrrrr');
    try {
      var data = {
        "dashboard": "getleadtask",
        "leadid":leadid??""
        
      };
        var jsonencode=jsonEncode(data);

      log(data.toString());
      log('dddddddddddd');

      var response =
          await http.post(Uri.parse(Urls.lead_country), body: jsonencode);

      var jsonresponse = jsonDecode(response.body);
      log(response.body.toString());

      if (response.statusCode == 200) {
        
          Fluttertoast.showToast(msg: jsonresponse['message']);
          return AddTasksModel.fromJson(jsonresponse);
        } else {
          Fluttertoast.showToast(msg: jsonresponse['message'].toString());
          Get.back();
        }
      
    } catch (e) {
      rethrow;
    }
  }
}
