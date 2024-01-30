 

 
import 'package:leadingmanagementsystem/allpackages.dart';
 

import '../model/forgot_otp_response.dart';
import '../service/forgot_otp_service.dart';
 

class ForgotOtpController extends GetxController {
  var forgotOtp = ''.obs;
  var forgototpservice = ForgotOtpService();
  List<ForgotOtpModel> _forgototp = [];
  List<ForgotOtpModel> get getforgototp => _forgototp;
  RxBool isotpLoad = true.obs;

Future forgotOtpController({staffotp, responseotp,context}) async {
    isotpLoad(true);
    if (isotpLoad.value) {
      _loadingBar(context);
    }
    try {
      var response =
          await forgototpservice.forgotOtpService(staffotp: staffotp,responseotp: responseotp);
      if (response != null) {
     
        Get.toNamed('/createpassword');

        isotpLoad(false);
       // Fluttertoast.showToast(msg: response.message);
       // Get.back();
      } else {
        Get.back();
        isotpLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
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
