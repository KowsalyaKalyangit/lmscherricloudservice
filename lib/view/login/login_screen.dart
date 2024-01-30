 

import 'package:leadingmanagementsystem/view/login/social_login.dart';

import '../../allpackages.dart';
import '../../utils/textstyles.dart';
import '../signup/signup_screen.dart';
import 'login_input_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   
  AssetImage? images;
  // String? token;

  @override
  void initState() {
    // loginController.loginController();
    super.initState();
    images = const AssetImage(
      "assets/images/applogo.png",
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
                            Container(
                              height:15.00.hp,
                              width: 40.00.wp,
                              decoration: BoxDecoration(
                                  image: DecorationImage(image: images!)),
                            ),
                             SizedBox(height: 1.00.hp),
                              Text('Professional Elevators Pvt. Ltd', style: heading),
                            SizedBox(height: 00.20.hp),
                            Text('Welcome Back', style: toptitlelogoStyle),
                            SizedBox(height: 00.30.hp),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Text(
                                    'Let’s login for explore continues',
                                    style: subtitleStyle,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 3.00.hp),
                            const LoginInputFields(),
                            SizedBox(height: 3.00.hp),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 30.00.wp,
                                  height: 00.20.hp,
                                  color: const Color(0xffE8E8E8),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8),
                                  child: Text(
                                    'Start quickly with',
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            fontSize: 9.00.sp,
                                            color: const Color(0xffB1BDC9),
                                            fontWeight: FontWeight.w500)),
                                  ),
                                ),
                                Container(
                                  width: 30.00.wp,
                                  height: 0.20.hp,
                                  color: const Color(0xffE8E8E8),
                                ),
                              ],
                            ),
                            SizedBox(height: 3.00.hp),
                            const SocialLogin(),
                            SizedBox(height: 2.00.hp),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignupScreen()),
                                );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Don’t have an account ? ',
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            fontSize: 10.00.sp,
                                            color: const Color(0xff373737),
                                            fontWeight: FontWeight.w500)),
                                  ),
                                  Text(
                                    'Create Now',
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            fontSize: 9.00.sp,
                                            color: appcolor,
                                            fontWeight: FontWeight.w600)),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 1.00.hp),
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
