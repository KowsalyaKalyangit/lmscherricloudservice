 
import 'dart:developer';


import 'package:http/http.dart' as http;

import '../allpackages.dart';
import '../model/login_model.dart';
 
 

class LoginService {
  Future<LoginModel?> loginService({email, password}) async {
    try {
      var data = {'email': email ?? '', 'password': password ?? ''};
      print('kkkkkkkkkkkkkkkkkkkkkkk');
      log(data.toString());
      var jsonencode=jsonEncode(data);
      var response = await http.post(Uri.parse('https://professionalelevators.in/api/servicelogin.php'), body: jsonencode);
      var jsonresponse = json.decode(response.body);
      log(jsonresponse.toString());

      if (response.statusCode == 200) {
        if(jsonresponse['success']==1){
    print('kowsiiiiii');
         
          log('successs-------------------------------');
          log('${jsonresponse['message']}');
          Fluttertoast.showToast(msg: jsonresponse['message'].toString());
          return LoginModel.fromJson(jsonresponse);
        }
        else{
           Fluttertoast.showToast(msg: jsonresponse['message'].toString());
             Get.back();
          
        }
    
        } else {
            return null;
        
        
        }
      
    } catch (e) {
      rethrow;
    }
  }
}
