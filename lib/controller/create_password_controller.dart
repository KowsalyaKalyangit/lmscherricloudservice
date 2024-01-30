import 'package:leadingmanagementsystem/allpackages.dart';
import '../model/create_password_response.dart';
import '../service/create_password_service.dart';
import 'login_controller.dart';

class CreatePasswordController extends GetxController {
  var forgotOtp = ''.obs;
  var createpasswordservice = CreatePasswordsService();
  TextEditingController newpassword = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  List<CreatePasswordModel> _createpassword = [];
  List<CreatePasswordModel> get getcreatepassword => _createpassword;
  RxBool isCreateLoad = true.obs;
  Future createPasswordController({context}) async {
    var response = await createpasswordservice.createPasswordsService(
        newpassword: newpassword.text, confirmpassword: confirmpassword.text);
    isCreateLoad(true);
    if (isCreateLoad.value) {
      
        _loadingBar(context);
      }

    try {
      if (response != null) {
        _createpassword.clear();
      _createpassword.add(response);
        isCreateLoad(false);
        Get.back();
        
      } else {
        isCreateLoad(false);
        Get.back();
      }
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