 


import 'package:leadingmanagementsystem/controller/forgot_otp_controller.dart';

import '../../allpackages.dart';
import '../../utils/signup_button.dart';
import 'create_password.dart';

 

class ForgotOtpField extends StatefulWidget {
  const ForgotOtpField({Key? key,this.responseotp}) : super(key: key);
 final String ?responseotp;

  @override
  State<ForgotOtpField> createState() => _ForgotOtpFieldState();
}

class _ForgotOtpFieldState extends State<ForgotOtpField> {
  

  bool hasError = false;
  String currentText = "";
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ForgotOtpController forgotOtpController=Get.put(ForgotOtpController());
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 0),
                child: PinCodeTextField(
                  appContext: context,
                  textStyle: GoogleFonts.jost(
                      textStyle: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                          color: Colors.white,
                          fontWeight: FontWeight.w600)),
                  pastedTextStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  length: 4,
                  //obscureText: true,
                  // obscuringCharacter: '*',
                  // obscuringWidget: FlutterLogo(
                  //   size: 24,
                  // ),
                  blinkWhenObscuring: true,
                  animationType: AnimationType.fade,

                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: MediaQuery.of(context).size.width * 0.15,
                    activeColor: appcolor,
                    selectedFillColor: appcolor,
                    selectedColor: Colors.white,
                    inactiveColor: const Color(0xffD9D9D9),
                    inactiveFillColor: Colors.white,
                    activeFillColor: hasError ? Colors.grey[100] : appcolor,
                  ),
                  cursorColor: Colors.white,
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  keyboardType: TextInputType.number,

                  onChanged: (value) {
                    // ignore: avoid_print
                    print(value);
                    setState(() {
                      currentText = value;
                    });
                  },
                  // onCompleted: (value) {
                  //   print('success');
                  // },
                  onCompleted: (value) {
                    forgotOtpController.forgotOtp(value);
                     
                  },
                )),
          ),
          SizedBox(height: 2.00.hp),
          ButtonIconButton(
            press: () async {
              if (forgotOtpController.forgotOtp.value.isEmpty) {
                Fluttertoast.showToast(msg: 'Please enter otp');
              } else if (formKey.currentState!.validate()){
                  forgotOtpController.forgotOtpController(context: context,
                    responseotp:widget.responseotp
                        .toString(),staffotp: forgotOtpController.forgotOtp.value) ;
              }
              
                        
            //  Get.to(CreateNewPassword());

             
             
            },
            bordercolor: logocolor,
            bgcolor: logocolor,
            text: 'VERIFY OTP',
          ),
          SizedBox(height: 4.00.hp),
        ],
      ),
    );
  }
}
