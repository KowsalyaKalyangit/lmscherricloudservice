import 'dart:async';
 import 'dart:developer';

import 'package:leadingmanagementsystem/view/homepage.dart';
import 'package:leadingmanagementsystem/view/ios_location_screen.dart';
import 'package:leadingmanagementsystem/view/login/login_screen.dart';

import '../allpackages.dart';
import '../utils/textstyles.dart';
 

 
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   String? _version;
    
  

  @override
  void initState() {
    super.initState();
   
    Timer(const Duration(seconds: 3), () async {
      String? token;
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      token = sharedPreferences.getString(Constants.token);
      log(token.toString());
      if (token != null) {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            fullscreenDialog: true,
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return HomePage();
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return FadeTransition(
                opacity:
                    animation, // CurvedAnimation(parent: animation, curve: Curves.elasticInOut),
                child: HomePage(),
              );
            },
          ),
        );
      } else {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            fullscreenDialog: true,
            transitionDuration: const Duration(milliseconds: 500),
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return LoginScreen();
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return FadeTransition(
                opacity:
                    animation, // CurvedAnimation(parent: animation, curve: Curves.elasticInOut),
                child: const LoginScreen(),
              );
            },
          ),
        );
      }
    }

        // Navigator.of(context).pushReplacement(MaterialPageRoute(
        //     builder: (BuildContext context) => const LoginScreen())
        );
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appcolor,
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Image.asset("assets/images/applogo.png",height: 12.0.hp,)),
          SizedBox(height: 1.0.hp,),
           Text('Professional Elevators Pvt. Ltd', style: toptitleStyle),

        ],
      )
    );
  }
}
  