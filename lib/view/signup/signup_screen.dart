 

import '../../allpackages.dart';
import '../../utils/textstyles.dart';
import '../login/login_screen.dart';
import 'signup_input_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
   
  AssetImage? images;

  @override
  void initState() {
    super.initState();
    images = const AssetImage(
      "assets/images/register.gif",
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
                            // Container(
                            //   color: Colors.white,
                            //   height: 30.00.hp,
                            //   width: 80.00.wp,
                            //   child: Image.asset(
                            //     "assets/img/login.gif",
                            //     height: 40.00.hp,
                            //     width: 80.00.wp, fit: BoxFit.fitWidth,
                            //     gaplessPlayback: true,

                            //     //    repeat: ImageRepeat.repeat,
                            //   ),
                            // ),
                            // SizedBox(height: 4.00.hp),
                            Text('Let’s Get Start', style: toptitleStyle),
                            SizedBox(height: 00.20.hp),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Text(
                                    'Create an account to get all features',
                                    style: subtitleStyle,
                                  ),
                                ),
                              ],
                            ),

                            const SignupInputFields(),

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
                           // const SignupSocialLogins(),
                            SizedBox(height: 4.00.hp),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()),
                                );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Already have an account ? ',
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            fontSize: 10.00.sp,
                                            color: const Color(0xff373737),
                                            fontWeight: FontWeight.w500)),
                                  ),
                                  Text(
                                    'Log in',
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
