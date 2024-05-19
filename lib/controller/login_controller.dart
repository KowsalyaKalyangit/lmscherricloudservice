 

 
 
 
 

 

import 'dart:developer';

import 'package:leadingmanagementsystem/model/login_model.dart';
import 'package:leadingmanagementsystem/service/login_service.dart';
import 'package:leadingmanagementsystem/view/homepage.dart';

import '../allpackages.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  List<LoginModel> _loginmodel = [];
  List<LoginModel> get getloginmodel => _loginmodel;
  RxBool isloginLoad = true.obs;
  //otp

  LoginService loginService = LoginService();
  Future loginController({context}) async {
    log('enterrr');
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();

    if (email.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter vaild email');
    } else if (password.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter password');
    } else {
      isloginLoad(true);
      if (isloginLoad.value) {
        _loadingBar(context);
      }

      try {
        log('enterr1');
        var response = await loginService.loginService(
            email: email.text, password: password.text);
log('enterr2');
        if (response != null) {
          log(response.email);
          _sharedPreferences.setString(Constants.token, response.token.toString());
          _sharedPreferences.setString(
              Constants.username, response.firstname.toString());
          _sharedPreferences.setString(
              Constants.staffid, response.staffid.toString());
              
         Get.to(HomePage());
          
         

          isloginLoad(false);
           
        } else {
          Fluttertoast.showToast(msg: response!.message);
          Get.back();
        }
      } catch (e) {
        rethrow;
      }
    }
  }

  // logout
  Future logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    try {
      sharedPreferences.clear().then((value) {
        email.text='';
        password.text='';
        //Get.back();
       // Get.offNamed('/login');
      });
    } catch (e) {
      rethrow;
    }
  }
}

void _loadingBar(BuildContext ctx) {
  showDialog(
      barrierDismissible: false,
      context: ctx,
      builder: (BuildContext context) {
        return const Center(
          child: Loader(),
        );
      });
}

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          // decoration: BoxDecoration(color: Colors.amber),
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 0.4,
          child: Center(child: const CircularProgressIndicator())),
    );
  }
}