import 'package:fluttertoast/fluttertoast.dart';
import 'package:leadingmanagementsystem/controller/change_password_controller.dart';
import 'package:leadingmanagementsystem/utils/textstyles.dart';

import '../../allpackages.dart';
 
import '../../utils/signup_button.dart';

class CreateNewPasswordInputFields extends StatefulWidget {
  const CreateNewPasswordInputFields({
    Key? key,
  }) : super(key: key);
  // final String? email;

  @override
  State<CreateNewPasswordInputFields> createState() =>
      _CreateNewPasswordInputFieldsState();
}

class _CreateNewPasswordInputFieldsState
    extends State<CreateNewPasswordInputFields> {
  void _togglecnewPinView() {
    setState(() {
      _isPinnewHidden = !_isPinnewHidden;
    });
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _isPinnewHidden = true;

  var passwordcontroller = TextEditingController();
  bool _isPinconfirmHidden = true;

  var confirmpasswordcontroller = TextEditingController();

  void _toggleconfirmPinView() {
    setState(() {
      _isPinconfirmHidden = !_isPinconfirmHidden;
    });
  }
ChangePasswordController changePasswordController=Get.put(ChangePasswordController());
 

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 23,
                right: 25,
              ),
              child: TextFormField(
                obscureText: _isPinnewHidden,
              controller: changePasswordController.newpassword,
                style: forminputstyle,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                          color: Color(0xFFDDDCDC), width: 0.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide:
                          const BorderSide(color: Color(0xFFDDDCDC), width: 1),
                    ),
                    hintText: 'Password',
                    contentPadding: const EdgeInsets.all(0),
                    suffixIcon: InkWell(
                      onTap: _togglecnewPinView,
                      child: Icon(
                        _isPinnewHidden
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        size: MediaQuery.of(context).size.height * 0.03,
                        color: Color(0xff292D32),
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.lock_outline_rounded,
                      color: appcolor,
                      size: 20,
                    ),
                    hintStyle: forminputstyle,
                    border: const OutlineInputBorder(
                      gapPadding: 4,
                    )),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
             Container(
              padding: const EdgeInsets.only(
                left: 23,
                right: 25,
              ),
              child: TextFormField(
                obscureText: _isPinconfirmHidden,
              controller: changePasswordController.confirmpassword,
                style: forminputstyle,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                          color: Color(0xFFDDDCDC), width: 0.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide:
                          const BorderSide(color: Color(0xFFDDDCDC), width: 1),
                    ),
                    hintText: 'Confirm Password',
                    contentPadding: const EdgeInsets.all(0),
                    suffixIcon: InkWell(
                      onTap: _toggleconfirmPinView,
                      child: Icon(
                        _isPinconfirmHidden
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        size: MediaQuery.of(context).size.height * 0.03,
                        color: Color(0xff292D32),
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.lock_outline_rounded,
                      color: appcolor,
                      size: 20,
                    ),
                    hintStyle: forminputstyle,
                    border: const OutlineInputBorder(
                      gapPadding: 4,
                    )),
              ),
            ),
            SizedBox(
              height: 8.00.hp,
            ),
            ButtonIconButton(
              press: () {
                // loginController.loginController(context: context);
                if (formKey.currentState!.validate()) {
                  setState(() {
                    if (changePasswordController.newpassword.text.isEmpty) {
                      Fluttertoast.showToast(
                          msg: "enter password");
                    } else if (changePasswordController
                        .confirmpassword.text.isEmpty) {
                      Fluttertoast.showToast(
                          msg:
                              'enter confirm password');
                    } 
                    else {
                      changePasswordController.changePasswordController(context: context).then((value) => Get.back());
                    }
                  });
                }
              },
              bordercolor: logocolor,
              text: 'Valid',
              bgcolor: logocolor,
            ),
          ],
        ),
      ),
    );
  }
}
