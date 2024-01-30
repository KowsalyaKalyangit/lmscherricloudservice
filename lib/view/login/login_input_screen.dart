 

import 'package:leadingmanagementsystem/controller/login_controller.dart';
import 'package:leadingmanagementsystem/view/home/home_screen.dart';

import '../../allpackages.dart';
import '../../utils/common_function.dart';
import '../../utils/textstyles.dart';
import '../forgot_password/forgot_password_screen.dart';
import 'package:flutter_geocoder/geocoder.dart';
 
import 'package:geolocator/geolocator.dart';
 
 
import 'package:google_maps_flutter/google_maps_flutter.dart';
 
import 'package:location/location.dart';
 
//import 'package:background_location/background_location.dart' hide Location;

class LoginInputFields extends StatefulWidget {
  const LoginInputFields({Key? key}) : super(key: key);

  @override
  State<LoginInputFields> createState() => _LoginInputFieldsState();
}

class _LoginInputFieldsState extends State<LoginInputFields> {
  LoginController loginController=Get.put(LoginController());
  
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _isPinnewHidden = true;
  GoogleMapController? _mapController;
    Location _location = Location();
  LatLng _currentLocation = LatLng(0, 0); // Default location
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  String stAddress = '';
    String latitude = 'waiting...';
  String longitude = 'waiting...';
  String altitude = 'waiting...';
  String accuracy = 'waiting...';
  String bearing = 'waiting...';
  String speed = 'waiting...';
  String time = 'waiting...';
  // AddAssignDetailsController addAssignDetailsController=Get.put(AddAssignDetailsController());
  var listdata=[];
  var listdata1=[];
   List<double> currentLocation = [];
   List<double> currentLocationlon = [];
   late Position currentpositon;
   var merge=[];

  void _togglecnewPinView() {
    setState(() {
      _isPinnewHidden = !_isPinnewHidden;
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.only(left:20.0,right: 20.0),
        child: Container(
          height: 35.0.hp,
          width: 100.0.wp,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: appcolor
          ),
          child: Column(
         
            children: [
              SizedBox(height: 4.0.hp,),
              Container(
                //color: Colors.white,
                height: 7.00.hp, width: 80.00.wp,
                // padding: const EdgeInsets.only(
                //   left: 20,
                //   right: 20,
                // ),
                child: TextFormField(
                 controller: loginController.email,
                  style: formstyle,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide:   BorderSide(color:   Color(0xffC6C6C6).withOpacity(0.5), width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                            color: const Color(0xffC6C6C6).withOpacity(0.5),
                            width: 1),
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
              Container(
               // color: Colors.white,
                height: 6.00.hp, width: 80.00.wp,
                // padding: const EdgeInsets.only(
                //   left: 20,
                //   right: 20,
                // ),
                child: TextFormField(
                  controller: loginController.password,
                  
                  obscureText: _isPinnewHidden,
                   style: formstyle,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide:BorderSide(color:const Color(0xffC6C6C6).withOpacity(0.5), width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                            color: const Color(0xffC6C6C6).withOpacity(0.5),
                            width: 1),
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          _togglecnewPinView();
                        },
                        child: Padding(
                          padding:
                              const EdgeInsets.only(top: 15, left: 5, bottom: 15),
                          child: Icon(
                            _isPinnewHidden
                                ? Icons.visibility
                                : Icons.visibility_off,
                            size: MediaQuery.of(context).size.height * 0.025,
                            color: const Color(0xffC6C6C6),
                          ),
                        ),
                      ),
                      fillColor: const Color(0xffC6C6C6),
                      hintText: 'Password',
                      contentPadding: const EdgeInsets.only(left: 10),
                      hintStyle: formhintstyle,
                      border: const OutlineInputBorder(
                        gapPadding: 4,
                      )),
                ),
              ),
              SizedBox(height: 2.00.hp),
              InkWell(
                onTap: () {
                 Get.to(const ForgotPasswordScreen());
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 14.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 9.00.sp,
                                color: screenbackground,
                                fontWeight: FontWeight.w600)),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 3.00.hp),
              ButtonIconButton(
                press: () {
                 
                    loginController.loginController(context: context).then((value)  {
                       

                     });
//loginController.loginController(context: context).then((value) =>  Get.to(HomeScreen()));
                   
        
                   
                  
                },
                bgcolor: logocolor,
                bordercolor: logocolor,
                text: 'LOG IN',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
