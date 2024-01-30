 

import 'package:leadingmanagementsystem/view/forgot_password/forgot_otp_field.dart';

import '../../allpackages.dart';
import '../../utils/textstyles.dart';
import '../login/login_screen.dart';

class ForgotOTPScreen extends StatefulWidget {
  ForgotOTPScreen({Key? key, this.email,this.responseotp}) : super(key: key);
  String? email;
String ?responseotp;
  @override
  State<ForgotOTPScreen> createState() => _ForgotOTPScreenState();
}

class _ForgotOTPScreenState extends State<ForgotOTPScreen> {
 
  AssetImage? images;

  @override
  void initState() {
    super.initState();
    images = const AssetImage(
      "assets/images/otp.gif",
    );
  }

  @override
  void dispose() {
    //  print('${widget.asset} dispose');
    images!.evict();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appcolor,
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 1,
              color: appcolor,
            ),
            DraggableScrollableSheet(
              builder: (BuildContext buildContext,
                  ScrollController scrollController) {
                return Material(
                    elevation: 5,
                    shadowColor: Colors.black,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(30.0),
                      topLeft: Radius.circular(30.0),
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30.0),
                            topLeft: Radius.circular(30.0),
                          ),
                          color: Colors.white),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          children: [
                            SizedBox(height: 4.00.hp),
                            Container(
                              height: 40.00.hp,
                              width: 80.00.wp,
                              decoration: BoxDecoration(
                                  image: DecorationImage(image: images!)),
                            ),
                            Text('Enter your Verification Code',
                                style: listtitle),
                            SizedBox(height: 00.20.hp),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Text(
                                    'We sent a verification code to +91 9876543234',
                                    style: subtitleStyle,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4.00.hp),
                              ForgotOtpField(responseotp: widget.responseotp.toString(),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginScreen()),
                                    );
                                  },
                                  child: Text(
                                    'Don’t receive code ? ',
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            fontSize: 9.00.sp,
                                            color: const Color(0xff373737),
                                            fontWeight: FontWeight.w500)),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    // forgotresendOtpController
                                    //     .forgotResendOtpController(
                                    //         mobileNumber:
                                    //             forgotPasswordController
                                    //                 .mobile.text
                                    //                 .toString(),
                                    //         context: context);
                                    Get.back();
                                  },
                                  child: Text(
                                    'Back',
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            fontSize: 10.00.sp,
                                            color: appcolor,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 5.00.hp),
                          ],
                        ),
                      ),
                    ));
              },
              // minChildSize<=initialChildSize
              // initial size of the sheet when app is opened.
              // default value 0.5
              initialChildSize: .9, //will take 30% of screen space
              //minimum size to which sheet can be dropped down.
              // default value .25
              minChildSize: .85,

              //max size to which  sheet can be dragged up
              //default value 1.0
              maxChildSize: 0.95,
            ),
          ],
        ));
  }
}
