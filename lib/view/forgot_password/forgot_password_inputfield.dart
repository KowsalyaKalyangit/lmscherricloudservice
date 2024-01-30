import 'dart:developer';

import 'package:leadingmanagementsystem/controller/forgot_password_controller.dart';
import 'package:leadingmanagementsystem/view/forgot_password/forgot_otp_screen.dart';

import '../../allpackages.dart';
import '../../utils/bootom_nav.dart';
import '../../utils/common_function.dart';
import '../../utils/textstyles.dart';

 

class ForgotPasswordInputField extends StatefulWidget {
  const ForgotPasswordInputField({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordInputField> createState() =>
      _ForgotPasswordInputFieldState();
}

class _ForgotPasswordInputFieldState extends State<ForgotPasswordInputField> {
  
 ForgotPasswordController forgotPasswordController=Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 3.00.hp),
        Container(
          color: Colors.white,
          height: 9.00.hp, width: 90.00.wp,
          // padding: const EdgeInsets.only(
          //   left: 20,
          //   right: 20,
          // ),
          child: TextFormField(
            style: forminputstyle,
            controller: forgotPasswordController.email,
           
           // maxLength: 10,
            //obscureText: _isPinnewHidden1,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: const BorderSide(color: appcolor, width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(
                      color: const Color(0xffC6C6C6).withOpacity(0.5),
                      width: 1),
                ),
                suffixIcon: InkWell(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 15, left: 5, bottom: 15),
                    child: Icon(
                      Icons.email_outlined,
                      size: MediaQuery.of(context).size.height * 0.025,
                      color: appcolor,
                    ),
                  ),
                ),
                fillColor: const Color(0xffC6C6C6),
                hintText: 'email',
                contentPadding: const EdgeInsets.only(left: 10),
                hintStyle: formhintstyle,
                border: const OutlineInputBorder(
                  gapPadding: 4,
                )),
          ),
        ),
        SizedBox(height: 3.00.hp),
        ButtonIconButton(
          press: () async {
            if(forgotPasswordController.email.text.isEmpty){
              Fluttertoast.showToast(msg: 'pls enter valid email');
            }
        else{
            await forgotPasswordController.forgotPasswordController().then((value) {
             Get.to(ForgotOTPScreen(email:forgotPasswordController.email.text.toString(),responseotp: forgotPasswordController.getforgotpassword[0].data[0].otp.toString(),));
           });
       }
           
          },
          bgcolor: logocolor,
          bordercolor: logocolor,
          text: 'SUBMIT',
        ),
      ],
    );
  }
}
