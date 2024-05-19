 

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:leadingmanagementsystem/allpackages.dart';
import 'package:leadingmanagementsystem/controller/login_controller.dart';
import 'package:leadingmanagementsystem/utils/common_variable.dart';
import 'package:leadingmanagementsystem/utils/login_button.dart';
import 'package:leadingmanagementsystem/utils/small_action_button.dart';
import 'package:leadingmanagementsystem/view/ios_location_screen.dart';
import 'package:leadingmanagementsystem/view/login/login_screen.dart';
import 'package:leadingmanagementsystem/view/map/map_page.dart';
import 'package:leadingmanagementsystem/view/map/track_page.dart';
import 'package:permission_handler/permission_handler.dart';

import '../service/map_service.dart';
import '../utils/textstyles.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return AnimationPage();
  }
}

class AnimationPage extends StatefulWidget {
  AnimationPage({Key? key}) : super(key: key);
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  int state = 1;
LoginController loginController=Get.put(LoginController());
var pages=[
  TrackPageData(),
  IosLocationScreen()
];
  @override
  Widget build(BuildContext context) {
    final double height = 25.0.hp;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: BezierClipper(state),
            child: Container(
              color: appcolor,
              height: height,
            ),
          ),
          Positioned(
              top: 5.0.hp,
              left: 4.0.wp,
              child: Image.asset(
                'assets/images/logowhite.png',
                height: 10.0.hp,
              )),
               Positioned(
              top: 9.0.hp,
              right: 6.0.wp,
              child: InkWell(
                onTap: () {
                  showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title:  Text('Log Out?',style: heading,),
        content: Text(
                'Are you sure want to log out',style: listtitle,),
        actions: <Widget>[
        
           Row( 
            children: [
              LoginActionButton(text: 'Cancel',
              bgcolor: logocolor,
                style: loginbuttonstyle,
               bordercolor: logocolor, press: (){
                Get.back();

              }),
              SizedBox(width: 3.0.wp,),
               LoginActionButton(
                bgcolor: appcolor,
                style: loginbuttonstyle,
                
                text: 'Logout', bordercolor: appcolor, press: (){
                    

                  loginController.logout().then((value){
                    
                            Get.to(LoginScreen())!.then((value) {
                             
                            });
                           }) ;
                
              })
            ],
           )
        ],
      ),
    );


                },
                child: Icon(Icons.logout_outlined,color: screenbackground,))),
          Positioned(
            top: 7.0.hp,
            left: 24.0.wp,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Professional Elevators',
                  style: toptitleStyle,
                ),
                Text(
                  'Pvt. Ltd',
                  style: toptitleStyle,
                )
              ],
            ),
          ),
     Platform.isAndroid?
   TrackPageData():

 Platform.isIOS?
   IosLocationScreen():Card()


    //Platform.isAndroid?     TrackPageData():Platform.isIOS?IosLocationScreen():Container(),
        
        ],
      ),
    );
  }
}

class BezierClipper extends CustomClipper<Path> {
  final int state;
  BezierClipper(this.state);

  Path _getInitialClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 414;
    final double _yScaling = size.height / 363.15;
    path.lineTo(
        -0.003999999999997783 * _xScaling, 341.78499999999997 * _yScaling);
    path.cubicTo(
      -0.003999999999997783 * _xScaling,
      341.78499999999997 * _yScaling,
      23.461000000000002 * _xScaling,
      363.15099999999995 * _yScaling,
      71.553 * _xScaling,
      363.15099999999995 * _yScaling,
    );
    path.cubicTo(
      119.645 * _xScaling,
      363.15099999999995 * _yScaling,
      142.21699999999998 * _xScaling,
      300.186 * _yScaling,
      203.29500000000002 * _xScaling,
      307.21 * _yScaling,
    );
    path.cubicTo(
      264.373 * _xScaling,
      314.234 * _yScaling,
      282.666 * _xScaling,
      333.47299999999996 * _yScaling,
      338.408 * _xScaling,
      333.47299999999996 * _yScaling,
    );
    path.cubicTo(
      394.15000000000003 * _xScaling,
      333.47299999999996 * _yScaling,
      413.99600000000004 * _xScaling,
      254.199 * _yScaling,
      413.99600000000004 * _xScaling,
      254.199 * _yScaling,
    );
    path.cubicTo(
      413.99600000000004 * _xScaling,
      254.199 * _yScaling,
      413.99600000000004 * _xScaling,
      0 * _yScaling,
      413.99600000000004 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      413.99600000000004 * _xScaling,
      0 * _yScaling,
      -0.003999999999976467 * _xScaling,
      0 * _yScaling,
      -0.003999999999976467 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      -0.003999999999976467 * _xScaling,
      0 * _yScaling,
      -0.003999999999997783 * _xScaling,
      341.78499999999997 * _yScaling,
      -0.003999999999997783 * _xScaling,
      341.78499999999997 * _yScaling,
    );
    return path;
  }

  Path _getFinalClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 414;
    final double _yScaling = size.height / 301.69;
    path.lineTo(-0.003999999999997783 * _xScaling, 217.841 * _yScaling);
    path.cubicTo(
      -0.003999999999997783 * _xScaling,
      217.841 * _yScaling,
      19.14 * _xScaling,
      265.91999999999996 * _yScaling,
      67.233 * _xScaling,
      265.91999999999996 * _yScaling,
    );
    path.cubicTo(
      115.326 * _xScaling,
      265.91999999999996 * _yScaling,
      112.752 * _xScaling,
      234.611 * _yScaling,
      173.83299999999997 * _xScaling,
      241.635 * _yScaling,
    );
    path.cubicTo(
      234.914 * _xScaling,
      248.659 * _yScaling,
      272.866 * _xScaling,
      301.691 * _yScaling,
      328.608 * _xScaling,
      301.691 * _yScaling,
    );
    path.cubicTo(
      384.34999999999997 * _xScaling,
      301.691 * _yScaling,
      413.99600000000004 * _xScaling,
      201.977 * _yScaling,
      413.99600000000004 * _xScaling,
      201.977 * _yScaling,
    );
    path.cubicTo(
      413.99600000000004 * _xScaling,
      201.977 * _yScaling,
      413.99600000000004 * _xScaling,
      0 * _yScaling,
      413.99600000000004 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      413.99600000000004 * _xScaling,
      0 * _yScaling,
      -0.003999999999976467 * _xScaling,
      0 * _yScaling,
      -0.003999999999976467 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      -0.003999999999976467 * _xScaling,
      0 * _yScaling,
      -0.003999999999997783 * _xScaling,
      217.841 * _yScaling,
      -0.003999999999997783 * _xScaling,
      217.841 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;

  @override
  Path getClip(Size size) =>
      state == 1 ? _getInitialClip(size) : _getFinalClip(size);
}
