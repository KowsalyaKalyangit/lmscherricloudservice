import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/model/change_password_response.dart';
import 'package:leadingmanagementsystem/service/change_password_service.dart';
import '../model/create_password_response.dart';
import '../service/create_password_service.dart';
import 'login_controller.dart';

class ChangePasswordController extends GetxController {
   
  var changepassword = ChangePasswordsService();
  TextEditingController newpassword = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  List<ChangePasswordModel> _changepassword = [];
  List<ChangePasswordModel> get getchangepassword => _changepassword;
  RxBool isCreateLoad = true.obs;
  Future changePasswordController({context}) async {
    var response = await changepassword.changePasswordsService(
        newpassword: newpassword.text, confirmpassword: confirmpassword.text);
    isCreateLoad(true);
    if (isCreateLoad.value) {
      
        _loadingBar(context);
      }

    try {
      if (response != null) {
        _changepassword.clear();
      _changepassword.add(response);
        isCreateLoad(false);
       
        
      } else {
        isCreateLoad(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }}

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
